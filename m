Return-Path: <linux-leds+bounces-8158-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCBqDSVFCWqzSgQAu9opvQ
	(envelope-from <linux-leds+bounces-8158-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 06:33:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E468855F35F
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 06:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AFF030059B8
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 04:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93ED2D0292;
	Sun, 17 May 2026 04:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="CahdXBr+"
X-Original-To: linux-leds@vger.kernel.org
Received: from outbound.ms.icloud.com (ms-2001i-snip4-11.eps.apple.com [57.103.73.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7530C15F
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 04:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.73.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778992416; cv=none; b=sfsM+NZ+2HaVZ1DyRhEP9flipA7z4prrAvEjMsWxcZ6+gDUVd4GDe9r1WGIsdK8weR+UKQCdxH/KtIFvEnm3EhUHV4iScLdFChGwSpr8WYcRpUFPX0EyNBvOfc7bKTCzcgjMsJD2GqdMf9uy/Pkl9qglj6nRbJu6INQuzhhfuss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778992416; c=relaxed/simple;
	bh=jJGaahjb9QGkjkJ48lJ+jlmft1IfBzoed2hrRRynJPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kz1op4EaZfzAx4Y2zZhtS6g0GqdsA+Eov0+WyKclVXBY1hQ1iQtFX3GrVSRyfJDQEdcbvfaAHDOqXcCC7BpjMnS2gf+30wP8ljqU7TT/6579cvuVw7dAWNxe6cKmA/Rg1g4I2JdN61cfKMDiznkOim0VMwM9KGS36w1mDnXBGWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=CahdXBr+; arc=none smtp.client-ip=57.103.73.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-0 (Postfix) with ESMTPS id C732C18000BF;
	Sun, 17 May 2026 04:33:33 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEC0AFBlgARnkRUAFYHlZeWhdeTVEPDwNKEAJeBV1yGVoUXBhTRVEfVFhBDgpTEhhcFFxQWB5GElYNXQkZBkFeUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04DWAZcAkQKSwNeGVoFQQhJHlwaGEEYCEsBW3cCURxWDVdDVARfThkMSh1SVlsTVRdGCQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778992415; x=1781584415; bh=pntJZz4ASNwNYeCzPrxG6rNSHK6j2SdyBylMTqcBJCE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=CahdXBr+oKRn6v7pMcGXHeyVMaYYuKrKg8uOsUnArGYkJ/YCYwfl8io7C1H2v4RKrSJdkk9Imdz4cEMWsCBIIOfEpEhhbFw+STodBhxgGglUVolaKIGkqVQlSjviVUcVXBWGnrpAYO36bpic4p6kjykc9qhrclw6jXUmUDWoVsydt5EibjuUBZCS3sOPWvfvxo/uhApNYdwBp31GvMcqrNb5xgx3ay+tnOMqP2tQrpEXDp7MGZpLB3zZ8yQknogxVdHCJTH0QwHTQdVVgmtufS8LdnMpuBVXM+pcxnnU2EAB1ODQ2/oM3r34vM/fZsVl+P7vZ+Y5RPO3ltomC96GMw==
mail-alias-created-date: 1778972301885
Received: from localhost.localdomain (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-0 (Postfix) with ESMTPSA id 3AF2618000A9;
	Sun, 17 May 2026 04:33:31 +0000 (UTC)
From: Sakurai Shun <ssh1326@icloud.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: fix typo in leds-lp55xx.rst
Date: Sun, 17 May 2026 13:32:53 +0900
Message-ID: <20260517043303.17111-1-ssh1326@icloud.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: J0wsYnZzPUUqh3meEAHVTnIbeJbLuspE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA0NiBTYWx0ZWRfX3LPqcK8EgBwO
 F5Ctrc2KDwIZIj9witADuDUOVy2okwzp1tdLlHJHYoeiyIYsnnhzoPo5JAGsvdklrkid+LINKBC
 WSNXx6MbXVws1BoJtDGuG9S82pwf2aCtEemD0qov9ijuJFdWmf4mkS/3ybm7ZWsC/F+oNX5TLJL
 QfOl2J/bXKdebNk9TUWJRbZSHSj1iTP3u7AqJ7ejmmRoi5F0QVNW5fVgidzCd6QmL4pRu6lAqeo
 /7YW9+NnSOFA/NmhFqxMOnntoFPryPnzy/PnIn7t0dR7h4L2BAGPOeQZ5TROoRy2Lyok33PVg88
 qluFO647XLEuE0JCJPia5tCkW/OuQddYV3jluaYYMDGrDYk9XfcRsu7a1pdbd4=
X-Proofpoint-GUID: J0wsYnZzPUUqh3meEAHVTnIbeJbLuspE
X-Authority-Info-Out: v=2.4 cv=NcHrFmD4 c=1 sm=1 tr=0 ts=6a09451e
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=ZxuoajvSgW0A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=7JAg27UwQIotZMEet8MA:9
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=
X-Rspamd-Queue-Id: E468855F35F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8158-lists,linux-leds=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssh1326@icloud.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[icloud.com:+];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[icloud.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,icloud.com:email,icloud.com:mid,icloud.com:dkim]
X-Rspamd-Action: no action

Replace "regsister" with "register"

Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
---
 Documentation/leds/leds-lp55xx.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/leds/leds-lp55xx.rst b/Documentation/leds/leds-lp55xx.rst
index 632e41cec..f60c7ec39 100644
--- a/Documentation/leds/leds-lp55xx.rst
+++ b/Documentation/leds/leds-lp55xx.rst
@@ -18,7 +18,7 @@ The LP55xx common driver provides these features using exported functions.
 
   lp55xx_init_device() / lp55xx_deinit_device()
   lp55xx_register_leds() / lp55xx_unregister_leds()
-  lp55xx_regsister_sysfs() / lp55xx_unregister_sysfs()
+  lp55xx_register_sysfs() / lp55xx_unregister_sysfs()
 
 ( Driver Structure Data )
 
-- 
2.54.0


