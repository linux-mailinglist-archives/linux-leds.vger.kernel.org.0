Return-Path: <linux-leds+bounces-6464-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1F2CDC414
	for <lists+linux-leds@lfdr.de>; Wed, 24 Dec 2025 13:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E1DD300CAE5
	for <lists+linux-leds@lfdr.de>; Wed, 24 Dec 2025 12:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A098C31691C;
	Wed, 24 Dec 2025 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzB/Uvm4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJ6dXdX3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242292EDD63
	for <linux-leds@vger.kernel.org>; Wed, 24 Dec 2025 12:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580328; cv=none; b=HQlWiXnJEU35fSJ3k7I5fXjRETajBnssVGAPftQHXx+O4RBkSFXM+pjXop0VrrcArzwCwJsNOHNy0Gmdql8nBSEgq2lF6v2lGfBMMBf4YWOh7A0w/qbIDrtU3mgxWkRbv0cGXSaM3zEMc6GilmA/OzlJuMYtUWuAIS3cf83j5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580328; c=relaxed/simple;
	bh=A0+rJ/jcjyo87GKNzaYx5E2SXVpyt5drNxPlXUUyifM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrCTULEEIytKEN0hLiRsY9A04mIkf4R9mcnCcRdn3geaoN7Vkh6K2Zw1tfYAFo3bjh2DpLTHXX2ODw/jPE3PIiTf581casFGA5o3K2+sjq80XyblZP80K++5zLwfd+jpV7a2rTfjXFWBoEvPXpluQ0gEe3Jw929v2VeJ+bQ0aNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzB/Uvm4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJ6dXdX3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8JK1M721758
	for <linux-leds@vger.kernel.org>; Wed, 24 Dec 2025 12:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QHbBmahycKCkeFq0h+J9dCWQdTsBuHKlmM6
	37HMXv+w=; b=JzB/Uvm4/nz4AklkPOHnlE8WRTnb7xGfwrwRrHhmW+1jHz3z03e
	+4on7xj6jfbi+LWLry94TihlUbd/jLwh9lQmDVu/5llODnwVgLdw+iSL/PCZvTjy
	ZX1KSLNA3FCJD/gQbO0xIc+TASfQeU7T7cbv5TupQEsV8uBbWFJq0E+oGhXWeO8d
	l81WsJYx3xuo0mjUzSIZyK1W1TMgtwUT3IoG5hDOJBeR9nxQbabYO9pbm4OKBtDk
	se+G1Xr4Ki2Le3MJIysyS4WT76wIgccd0aH5oJKif8EyBfC8uSReJfA9tSLVLNZ3
	wRdXNfYVtP4W2zWdNMNmGweV+V6Ezv2IymA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mta7wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 24 Dec 2025 12:45:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a92bf359so128773651cf.2
        for <linux-leds@vger.kernel.org>; Wed, 24 Dec 2025 04:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580325; x=1767185125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QHbBmahycKCkeFq0h+J9dCWQdTsBuHKlmM637HMXv+w=;
        b=VJ6dXdX3jsODpYjzH5vik5tkMtXvYJ7J4kzV3Qxn/eNV7j3go6DKlRLIvOHRKpz0U/
         ckEU8FF+POhc2DIomEWgqNolQiebXzWY2jbkwBDcwfKPc+EIYlJtNrSFEA0KQDlGxk28
         kE/6U0/8HFz0Wvs7nculQpRAnDcPc3Vkl1brOPLtzSOy7MMscKWsDeUscsBQCnNo9CgR
         4rIseTiFctzje3zgtRh4/ZLPi4BLCisrsCerlXJ4MwELUn/Zlu8K5j1RnbkyrnpWPT+f
         VUP13KyJX8Wc1ZUSBZ/jeMbDUH+StKxE3IVlRFLlVKRwKqeM0ItFMtT7/pn2p2yDm5Z+
         KkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580325; x=1767185125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHbBmahycKCkeFq0h+J9dCWQdTsBuHKlmM637HMXv+w=;
        b=l8tkVapXCiIaT+8FdL+qUY3Zt5y4eqg5svYrHOmd5Id3t/kjbHxnzRYKdA6gUxNqzj
         fXKnwVmliawuN1sUqfaySIq6CZIG/FFTVrd3gTgnLbTaYHF/tDFR49CmBfdPEYVgmbv6
         6xxerO4uaqufiaUqxw/53iGtfDo8mPyhf0LF4+WdiNFmPo2r75/vpr7hIk50plt8vqoD
         ACHFWjM8BR6KF5nHh14kXSHYmAjd+awryy8t6s9vKZJBXYum8JEcWPd4dSGMGlIB0tN5
         fCgcJd+vLFkXwwIRhthlK16oHVLurJMlo90z3st66GaHt9YIbHMbY0URSSD6ayhdWoCS
         M1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7FYkpD6H/xfgm28t70u0wHhc0CckkVNKoVwLfxbl4YhDu8FClQN0SRGBjopCPgmQpsyBpWHHqWAb@vger.kernel.org
X-Gm-Message-State: AOJu0YyHujqHSDNWEZzw9wllBqHREjTQFPFfqA78+LpNJJhZXxI0OxU3
	a220iwLjHsdwRK5bzvHpY0Y7AbeNkV6i0kFcnp/gnQ09LDO4HMf5FO7vqNainKvGXVKsFBhqOJ5
	zdCEZXVdG71qx7Ho/vNfb+JOCCNmy9eIDQOKbiThrTWxRnfIIELqZqXaG7sQyUhqr
X-Gm-Gg: AY/fxX4ktZNGEBo+U9Xb3/7UaO9jEzIldDW3kUn36Q0w8AXecJ7zHcMxLs1FMS7UEeu
	eL0voldIGf2JZPwx/j3pAuXF85NE2h/oHLrzN58pRlrttyfHdXBawWEPCXB+4mgRDsE8bkkm873
	D7Qd52jcJEJRR0nY4v4r7P8lqEdtGQwugeVN0a0ns+26mVWo/9u6cFuHs75HuXjdgcipdHhiEJy
	POWDOZYwYYKPrgPXFnc7euk8wcmOO/T4Kzs0658TpTcVO8+3c8G9dOceU/cDHD9hZutE1Pp6rGI
	vKTdHVmSK2kU3JtUJhnSsPfqsj53OvYKdHM4Bg12TMC6SyPeXKXvdeQApNgu1tEhKnI++nvWX3u
	odcfyQ6yhftSfLgyIoqJxoGWJfbeGFoYmbO9Gul1c7nB9DGNphPmtkChClOTELR7PANhbMQ==
X-Received: by 2002:a05:622a:a07:b0:4f1:ac56:3c05 with SMTP id d75a77b69052e-4f4abd97f66mr286460681cf.38.1766580325451;
        Wed, 24 Dec 2025 04:45:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFckI07eeRPrrqzU4lKfHT6hUGe8mpk74PBP7U30VqRr3mJ85xTL8ZBbRtqUJyjNTC9265xew==
X-Received: by 2002:a05:622a:a07:b0:4f1:ac56:3c05 with SMTP id d75a77b69052e-4f4abd97f66mr286460311cf.38.1766580325038;
        Wed, 24 Dec 2025 04:45:25 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105655asm17007068a12.9.2025.12.24.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:45:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] leds: lp55xx: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:45:22 +0100
Message-ID: <20251224124521.208635-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=A0+rJ/jcjyo87GKNzaYx5E2SXVpyt5drNxPlXUUyifM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+BhqMr3uCfDgDjtv57gr9p71LMXH/nVk7DxD
 FRm1vmguEOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgYQAKCRDBN2bmhouD
 1xA5D/9BTeFTVX1pzYzU1uPltHLPRHvs9dVi2F/LqgJc5d9nivAA7KkhNA3FWJbV+rSylAeAbGs
 J1fCoKtYDFh6d9WZ5x9WNDuBb+cGmQpRz6Dz3eCh+X2XgoFTSxyaTek73V+ioqe/28CUy8gWSnE
 COlZx8CoxI5UIXbhLBa+Z/rfpQ/kZcsWogBdpsMqiefYRzC9KQJB8WFOeIzsjGD9b12eFVF1M6K
 TsYCnHTdJ1fFfGDP8Hp0LABJaZze5d2BlW8UCOOEeeAyiZXV4Gk2J6ny2ocbsPfAhyvKCFu45bG
 oVp2blcJ3pRLx/yneqsEfn6k/k1J9PbHqgv23ebSWom2PTVmt8H2LDJ2Wqd/v5ElZonI5lX5PTB
 oaIrSkx3lRWDpmtKhhgP/6P1DnXq/VY82acXuv3V3T4XUzOX8iWXAIp+BlPuBnXCPclTAwlchjp
 WG/OvBOGUmvoVxHtJ+m1F9QErgosjwAxRg/0sQuYpJ+31omE83SFLZZutTnGAFhWUzEbgm+p5bF
 3wJa/5wrwyW2xuf2IedykV94OI5L/6aWrXhft+7i3L2aQgXY/2sUTgNtYZKmAASktyRvNDVs3kY
 gwrcYmvCu1AX0dm77kmt0tMCxGlI18U1TnnMCHQzEm/tJ4W7/jHprkpXBJcQV+4SQ4nqgSzxsF2 4r35h1CviTU5H4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694be065 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: YV4hDkFws24RCPmixoYEbX1Lf-gKqh9d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX0UPEbroFq0N9
 yucOWDCB/dizTTYStfKsklmlN2ZY3bt0MqyxWA+UQ1knTl9sitjJam2KJnf9o9jEaSDJgeiCbuN
 3CCVwGyX7HBQo1BZ4SgO1zwtuWUXntrKbkt88NTFbzH9gATog4GJakPAQI2VcrG/poFB9vUThTF
 R8c3XcxAn1Uo1de4jMZeYprE4mUbirHjCdvWWhfqaT1lQN+wpZdlMbCnFP6o5v3+g11HJup+/4M
 Ul198+OTdizaHAEl/7l3g4yoe4D+xqz6gdnixvpHUk/TbqmL1w8JqiBP+fwMlOgC6LBx7QxTtM7
 1DsbCe/RnfADAfVLELYhXKxUk5fpRs592T7Pg6YkxSo+jps91bKbpmpDqW/lYiX+kr37PhntOgQ
 q21P9gmKOwK1TU8l3UMLHbiDRfm1APDdsvg8sAx7FGTBHghjkcI/YYtdh8BnFewjv0QQFRkpH38
 XC0zlfdZoVU1Ay8Qdmg==
X-Proofpoint-ORIG-GUID: YV4hDkFws24RCPmixoYEbX1Lf-gKqh9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/leds/leds-lp55xx-common.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index fd447eb7eb15..ea131177de96 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -1204,7 +1204,6 @@ static struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 							     struct device_node *np,
 							     struct lp55xx_chip *chip)
 {
-	struct device_node *child;
 	struct lp55xx_platform_data *pdata;
 	struct lp55xx_led_config *cfg;
 	int num_channels;
@@ -1229,12 +1228,10 @@ static struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	pdata->num_channels = num_channels;
 	cfg->max_channel = chip->cfg->max_channel;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		ret = lp55xx_parse_logical_led(child, cfg, i);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ERR_PTR(-EINVAL);
-		}
 		i++;
 	}
 
-- 
2.51.0


