Return-Path: <linux-leds+bounces-7372-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JbdIJ9NumlUUAIAu9opvQ
	(envelope-from <linux-leds+bounces-7372-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 08:00:47 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D97B2B69B6
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 08:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B6973027133
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 07:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEFE3314BF;
	Wed, 18 Mar 2026 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="WHM/SOdJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9A6363084;
	Wed, 18 Mar 2026 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817244; cv=none; b=pxU21ETCFKluvGG7hOIkjPEEV2J06PkNZbBrtv5Viyt8hOfrS+kxKfJcsoPqu3+yqLuidcZnQHD2xWCJVtEPtBQDSPiGTjCaeO8HtsMokZOJLSjIMpkTDez41tHj56UtJr+l2zsENJQmW0xLkYoQIrh0LF0ETwVK2k6Jqu65a+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817244; c=relaxed/simple;
	bh=AfAqT8JHwrYqUWmTu5Ys4CtZOYcQMHvpI3fqf+daNZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=g06AxuYcBBQqr8cfweX70EhanBjXPSr41BJLjmEPhAE0otNontSVXw/PEIzantnM4ENRNLMbN32trPmI2X/t+2Vf4u+ILAnmlam/6r0LNiw5K58sMx7mCBoSHXfN3JVB2aXQ8fFD69qoIHdL8BgDKfdW4B4hqE5OWqU/EPJlrZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=WHM/SOdJ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I5KhnQ1782085;
	Wed, 18 Mar 2026 03:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=quph0
	Va7DGCB0/RYgJGz91Pd6uU0z4Tq38pafhYItNs=; b=WHM/SOdJ643ly7BxFk3ZZ
	kGLt39Y0SaKMkOXnJj2pjUzRIIhS81qwqbVL8NA/hBPrqYKcX+PuYbgHNLGpaK+L
	Q1POsofeQAU++o/3vmH6zuMXt2xXSCQ56p3x/yIVlu0UnKqXh5vPmxzP7+3Ebyqi
	aSFsLPXjyExGn1EA+KJpU6pMM0S5iQN3QvWOJCrjzBNONZAcXZu291OEXprHSLMj
	zYDZsTFYuvIty/24JxTo1afmgj+UBi41h49YGBBjTifrrRfauExBIYHuKq4s1tYV
	H0FARxznC6ihwpc2M1bxJrq+9CCfC6prBN2hsOW9BjqX5ebe4fPKDKljQEW1ns/T
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cyjf81hwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 03:00:40 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62I70dKU010598
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Mar 2026 03:00:39 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 18 Mar 2026 03:00:39 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 18 Mar 2026 03:00:39 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 18 Mar 2026 03:00:38 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.27])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62I70PXH031847;
	Wed, 18 Mar 2026 03:00:33 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Wed, 18 Mar 2026 14:59:20 +0800
Subject: [PATCH 1/3] Add Maintainers to LTC3208 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260318-upstream-ltc3208-v1-1-015f1f1e9065@analog.com>
References: <20260318-upstream-ltc3208-v1-0-015f1f1e9065@analog.com>
In-Reply-To: <20260318-upstream-ltc3208-v1-0-015f1f1e9065@analog.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Jan Carlo Roleda <jancarlo.roleda@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773817226; l=781;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=AfAqT8JHwrYqUWmTu5Ys4CtZOYcQMHvpI3fqf+daNZs=;
 b=nICFKxgVQoKiHJKXHEkqFtpauFH2Q4Ruak0mkVbDfv/IMelCyeiFzbCVlrPlIBsXPGz+BDqtH
 q4lToBBB6M0DTJK6rkrU/h7fUU7NreO+VjZXRuCVgusqaXVRoEC8X43
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=Rcidyltv c=1 sm=1 tr=0 ts=69ba4d98 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=gDHzu7jOUVDSfYWjZv0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GCWukxyGc1lveO7l99bZsc9_Rlqxnfw2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA1NyBTYWx0ZWRfX5z0diBJKU4lw
 WWxNKDkkbYIHQfrMEjSDSpHyVO/qot+iqI50/eqHZekaOZnsZy96Kplj+lKLd9B4PLBZbytPWQE
 tOZw79pHY5kH1xo9fZeogd88o1znC3ivGpacvK7lCCvArnsnJpp24mfqHkS0nbZlbwxqbRorOZA
 uHDbA3PQuahoulsnaxpXjUrX0KnEERwCtCgWvzx3Jw78rJGs29zBBPi8hGl3nXDYccVwsusiV9N
 UlR0oconSnRtIAGzQYPp/eULzTGaqESlJQobygeaWmCmd31gyq+u4D7/oE+ok+CVGIDtdzRSxwo
 4l1NyO2X7HnDX29X1PNqcz81o7PFHHAgiAPltr6iwLGyrcfgYRGqvALvaOCvqjznesOr66popbl
 6VrGHOINlFdc8pt1Dari5ndKi5AAsENe7vwzDofIuX4k5OnQ4JH4NkVIVi3CVjcb2/HdtepXVlN
 dNJWzd4eELE6aKE4KAw==
X-Proofpoint-GUID: GCWukxyGc1lveO7l99bZsc9_Rlqxnfw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180057
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7372-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:dkim,analog.com:mid,analog.com:email,analog.com:url];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7D97B2B69B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adds maintainer reference for the LTC3208 LED Driver.

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..3f3331d7272a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15126,6 +15126,12 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
 F:	drivers/iio/temperature/ltc2983.c
 
+LTC3208 LED DRIVER
+M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+W:	https://ez.analog.com/linux-software-drivers
+
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.43.0


