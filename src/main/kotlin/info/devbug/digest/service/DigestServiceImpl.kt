package info.devbug.digest.service

import info.devbug.api.Digest
import info.devbug.digest.repository.DigestDto
import info.devbug.digest.util.DigestParser
import info.devbug.digest.repository.DigestRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

/**
 * @author Aliaksei Bahdanau.
 */
@Service
open class DigestServiceImpl : DigestService{

    private val digestRepository: DigestRepository

    @Autowired constructor(digestRepository: DigestRepository) {
        this.digestRepository = digestRepository
    }

    /**
     * Returns the Digest object according to specified the digest file path.
     */
    fun getDigest(filePath: String): Digest {
        val digestParser = DigestParser()
        return digestParser.getDigest(filePath)
    }

    /**
     * Parses [Digest] title and returns current digest number.
     */
    fun getDigestNumber(digestTitle: String): String {
        val digestParser = DigestParser()
        return digestParser.getDigestNumber(digestTitle)
    }

    override fun findAll(): List<DigestDto> {
        return digestRepository.findAll()
    }
}