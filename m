Return-Path: <linux-leds+bounces-7500-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DahNupixGkuywQAu9opvQ
	(envelope-from <linux-leds+bounces-7500-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:34:18 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 665BE32D0D5
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 636F03032646
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 22:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F223F344DAC;
	Wed, 25 Mar 2026 22:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="IQPkNjML"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8122D3382EC;
	Wed, 25 Mar 2026 22:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774477947; cv=none; b=Py/kZJ8yTvgP5cVFVhGK74N6IBjj9gxzlul8NqdsJ69DF6axkyhziWSiVvJL0DxHUZ3xPz6hKpqXzzBbyd6BNvdYK/OjO9y6L15O82xEa0DSiwpBwH+9OSXzkFb12eiz0FyLdqEp6EViitdXt0qgLKbM9KrxkV0wT7Qh092Y5TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774477947; c=relaxed/simple;
	bh=AfAqT8JHwrYqUWmTu5Ys4CtZOYcQMHvpI3fqf+daNZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OpSHRgBopffA7BzbIlIQ1KVIopCDQu5rf6tbUKP8ZUTWMk++MGwUbiS8M+6G9/vzkd7q8NxTN2ZEk6GgN7MUmXt3+UDn2llWQX+CQXKE+aFD1IcR/88OlmujjTJ1BWyzdmYU+6yOiTt8zWGL62+DEDzG5bi7nz9fuDTjks8iWJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=IQPkNjML; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PJ8i2E3262248;
	Wed, 25 Mar 2026 18:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=quph0
	Va7DGCB0/RYgJGz91Pd6uU0z4Tq38pafhYItNs=; b=IQPkNjMLbydRMnVZd9Fim
	8RF52qAHqZRcMLe+yPj6ihRvqZE6LS1MgutqhdZePFL8yuOnaMUz+Fon2IXE4quO
	Dtn2Jtz6QmGGlpTTM5rzjOjw9C655BCw2qi3n0GoOIYULJpySfYnRNYF1pemJklg
	5qHUSnXmVpGC8jF+FTna76V5sHdasG0BnNkLS+uBRKqjKwgGsVn5E1nO3lECkH2l
	Z65qD6bTyddy1U4Nh5WYe96NXdaIgOK/GtXtNDYCeHC5pwO12g8LnscFBgqX8O4i
	PruniZeipYQ7bGq3WpgOS4/XbQYzebhlCfZlsReB16Q4daMURlbtLAVEB834/c0V
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4d4gygt3wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 18:32:17 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62PMWGC3054877
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Mar 2026 18:32:16 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 25 Mar
 2026 18:32:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 25 Mar 2026 18:32:16 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.22])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62PMW4ai032703;
	Wed, 25 Mar 2026 18:32:12 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Thu, 26 Mar 2026 06:30:10 +0800
Subject: [PATCH v2 1/3] Add Maintainers to LTC3208 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260326-upstream-ltc3208-v2-1-3dbc992b6098@analog.com>
References: <20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com>
In-Reply-To: <20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774477924; l=781;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=AfAqT8JHwrYqUWmTu5Ys4CtZOYcQMHvpI3fqf+daNZs=;
 b=meBcbicmoS09Ngtv4gzZDnLkmfHPKsHiEuq9h0KVCo6//IppyMM0ONtFWCjkSFZOMknR3e340
 Jad3pTOz5tABBYIgJzlkLjfLfq5WLSjGEA/GNZBnH5J5TTIVqTPsDmJ
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2NyBTYWx0ZWRfX99sVAMdQwqPg
 Rk7+yIBzuQue9gEJ3uJSIupFOXNlxGNAVr3laMhmgU9klxQISS6dudfB3yzx6cOfnbBu1EJ2DQr
 uwSkSwTEHzcs/1/kirrUW66YTBcLsQvpUwJtzX4Bc99R33HtPR+gIv8sNhvG7wpo3G/nPMxYt2K
 /cQlYgDx7f6VFhcLpg/DIkCzmGsB3pXQ4StTedu9ngRcOVt3hAg4TpuKLfNdNatoMcAm2Hk9QsW
 Edd9yJBlpUIxbb9K1Bu0k6Tx1TYLfIerd6uaTTwIaa++/y9WVz4l/1TKUcuqYho+Q666elS5imM
 VYSpHvYVc7UdrRJR00bJU93UdZqd+p+Qcm4nMEdyoldPFcpzFnTibP6ex+/Oops2uvL3Z9SKZKN
 Q7NDu9VSK3Vnf1xakgEIsYH1d3nj9z8xsWOklupWPFTZMa0kg1leNhpuPbDlz6X8y5gGae8WH1U
 43SoP+kkIKSp+jXLFCA==
X-Authority-Analysis: v=2.4 cv=ZsTg6t7G c=1 sm=1 tr=0 ts=69c46271 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=gDHzu7jOUVDSfYWjZv0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ZxF-88sE1-BVm8EYtR_W-5EccJz7okfY
X-Proofpoint-GUID: ZxF-88sE1-BVm8EYtR_W-5EccJz7okfY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250167
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
	TAGGED_FROM(0.00)[bounces-7500-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:mid,analog.com:email,analog.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 665BE32D0D5
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


