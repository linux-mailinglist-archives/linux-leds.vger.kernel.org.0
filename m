Return-Path: <linux-leds+bounces-7992-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO9zOFvL+Wn3EAMAu9opvQ
	(envelope-from <linux-leds+bounces-7992-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 12:50:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE704CBD3A
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 12:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C277B304A099
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 10:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1791F2D8DC3;
	Tue,  5 May 2026 10:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+WBRSuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaTFZKTi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84903016F5
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976941; cv=none; b=VjeVtup9zLEKqMkd419zpl962qsbblmyy2akiY1Fff0IClj5zDEh1fPoz8QieR0nABNj6u3/BSQEVnJtgzyMlhcz+fiASIIA2hqURIEOTTfY2Axa6iisPZvuAtPRPfnyj4brdefcicpUUkVh+C7AMEgyc3X8GwO8Ax3LiZUDz0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976941; c=relaxed/simple;
	bh=kILhQAgY3kLM16GxFMfnMK5G+NAgnlyKR3dgRK8YfZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rmNe5HwiWcdlIA2Q3EpQOIgP8QQRFA4qV54CICHSOB6oNYNB6V8NixDHVcKjdbB0ygeDv6a9Jcqdx4G0VgHl+rDgkVf9YsToSWEUNYZolm73ZRjvOw3aLXFaLc8hC/ndkfa5BHippyDZ7PyOXQRu+ALVGLfyldpfukipGzM3dcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+WBRSuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaTFZKTi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456HHmr331125
	for <linux-leds@vger.kernel.org>; Tue, 5 May 2026 10:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HNlj60pJs02U5K85HJFOtq
	Zd7kl+At2FS1ldDOM8a5U=; b=E+WBRSuHgX8tuxSzKI1QFKFVkIjX265Hi2b9Rk
	qt2ZUpzOxrqWTxNzjWrWv5od9PCeXOFmgSOcyevZ+NDTeysIICCkOxDrmaxwRpkT
	q0KIdSvZ2c68X1ap6eCnC+8YVfvjp0ay4Nc9r85Hvwp5rY7EoE1XeCK4JWuUWRxp
	773SCZVke0K280g13Ok02Qu2zN625zq4NYUqfg8SqmGtq5gxLMpwTeGqN6lzu4ca
	TZhdhJkB4keP1btznh9QYLxyLVhxRN6RvSKn0j7HG0WEyL2zhA9eSbuIB9BijW//
	mJIxj9+kqo7T0mEXVWW52rFcU4AdY/IJWk8laI4k0++DF56g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1c0s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 10:28:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5104b861649so22560951cf.1
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976938; x=1778581738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HNlj60pJs02U5K85HJFOtqZd7kl+At2FS1ldDOM8a5U=;
        b=UaTFZKTiGXDC3fsd5aDDEOGfQcqQfhMYwn8/KVaC97TnFBd2XUzKrAz3lrbb7dPtIO
         XcuCjGFio5OrdjFK+qgdTuAKzKh8WQ03bJzDfB/eeTnrEv9GlCHj6+gjNkPlygvfjydH
         mygqsDIHax38KqD1WvLryr1za7KiVt6B56FF2H0ICUd3qPJpN/XDRUsqOGXyEMn5F/42
         Na3Dn+QHDZxYo9ZAgwNr/7vgUYWgdG8FyLz48tRxaOzlpR4CW6j+lnuDAVqshhsAoCDA
         mMsJoZl2BxaO6Nu1Zc6nlw0zrHEHm91SK/iDAPMS0Kh7DhYyMbDfwoYyM7x9Ynz8LAA9
         0dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976938; x=1778581738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNlj60pJs02U5K85HJFOtqZd7kl+At2FS1ldDOM8a5U=;
        b=AitsUwI6Er4xC3uWf1yUmvMVXsdHyyWmuKBTjodFL4HLEQuitcL1YYf2MLbLSdjekb
         9kqa9xTbVOt0wgYyZK6ykvFCZRZ3xLwq56iT3fJmRLfBEaj4j4NGGsrGoaYo1/zeh+p3
         EteQslSPk1QiJogMbCSfXFwa0ogBFvyDGqvBTTYDMCgZHF5bmVU97M29B2TJisr1jRzX
         1OoTte/YGCG7+HZr6TzCHoJneS4zI5+njt+7xr1ZV1cxF9FIOxmXSVCSemZPzIT4tswk
         N5VNrxWxMIBeIzczoQ1qHjlkkxS9nSvFB8btypkADQIRfmjGj1p71OMIF0jW0or75fen
         vjSw==
X-Forwarded-Encrypted: i=1; AFNElJ/oGDGIgTPMMZYEHBynIIaeKhkQtta/eahjEaDrYRxTbZ8qVTl20lWOLcUMrwQrD+Hla4flaso5XMEP@vger.kernel.org
X-Gm-Message-State: AOJu0YwosGbi0gQFrtBBSn26db+TD95YOD2mPNzNce1NG4E7lIms8w28
	UtrNYPrIH85valHPdBOWJk4RET0zWABmo5xbDHoYIyM1BLw+jlb6gwjoY6qSVA0gNJIAMW47Pge
	usCfRbTDh+8tmi/ZuoEpnuSpFwm5WtCLJFOOoFvsOE6KtVvSm6PFlHprQlofExFlG
X-Gm-Gg: AeBDiesOYEoQ7RBrfIJMprgKci244g0f4oZ1dY0Nq6iGagAuPGvMT3taZOrposAojW6
	zj58J0iep9RTruvoWJ2ne89oBCf/aSTGiGkykhXg+VWrDBzPd5+AfTEBCYe9Pd2GgfHvnR0Ew/I
	99xOq0dx5qQj860gwLZn1dpH9tf+39Ml6aYBc5xqFdSk5aHUImnrIs1PQJGMCTBolaPtyPacvy3
	YHAYBgDWYgG0tNOBpdFixfxwsEPZFjJpNBwDlwyw4PkDmbHvO8IQ8yeoBticNs4wvvc8l59Uhee
	xXBNcZlLPBJTT2UfaDpgUXYnGEpv5VnSZu15HmVogzcFhlg0Rp1YZBfqmZRfBLmYrQHxvL/KqkV
	TN06V9Mw6ZhUMmFImelzi4e77ZxXEyAjfvXY9cbvpOuGiaAs=
X-Received: by 2002:a05:622a:a12:b0:50e:5b04:810b with SMTP id d75a77b69052e-51306a53f21mr35472601cf.32.1777976931471;
        Tue, 05 May 2026 03:28:51 -0700 (PDT)
X-Received: by 2002:a05:622a:a12:b0:50e:5b04:810b with SMTP id d75a77b69052e-51306a53f21mr35472161cf.32.1777976930638;
        Tue, 05 May 2026 03:28:50 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba865fsm307039245e9.10.2026.05.05.03.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:28:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] leds: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:28:45 +0200
Message-ID: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kILhQAgY3kLM16GxFMfnMK5G+NAgnlyKR3dgRK8YfZk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cZe19spmhey6vI4b/7yFmBq15pM1VGw4Lnc/
 0yugqzzGR+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGXgAKCRDBN2bmhouD
 1+IREACFnSRy7ju4VscC9G9J/FnjAyyotS+ISKZWGydzAX1MOB9PooZ37Sf5UDalokelUZojWyx
 +WlYegVlUgcHuj/owKI0xzKKlWPvAiZvZBJF8xpz7fB//0+gOLZTmASdI7KAc5m5baDtLHlCRU3
 yff/QwPa9U7qxINvtbwkiehLmw5d3kX2DBty0i0w1HsYcwsKuy3dEMamsQOyuugpFVUGg0vVnCv
 ElCuozk6ISPxKfqvd45OW/Tkc97bsYI5CcMMwcjJLxX4iQcJ6fKfVWC6rPEgiNlWYwflU8chPGz
 ZmbMxsaWTHZFcs1jiuui6sdmWSzjErhXteLFfaMg2NasVX4D6tnOpzF/Kl365cs1RBwryLXuvob
 WH40NocFZJsHEUelaeXcj6Ac10I2mP3CL8tet14HSRM/8SZEIhwsgvdTA2bTMEmHngqHIGhwvJZ
 nxnMOGPyFkORQDTKppoyrEwt4QCdexA3JMjD5q2kQSQocvIZtO5w9c2tmp0E7VOo8UneY5k16pM
 Iiwuc8ycvpIFz1YByD45DRaYhWEnUGX8Hy+I17MvaP5mTrutYXVLlUGo4r0LyahbdA1HnfIvrfU
 B0/GdY76K0MGfugaaFX6+dWIvth2w1djgET7sYBihXCBz2OC3o7iZ7PkwdhD7iIqMxppz9GjGf/ YrfAMNmEyXD8bVQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5Nc4ICJmj_W4AE3omHQDvGrsFUQgoxz_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX0dHBS3FswShJ
 LNkFkTiKPQBWH3t1W9hIbUDZF2uv/9xe8pEL0zg7RKzBvbCd7d//WDS6N1+Jy5phWODd45rpQwj
 3dayh0+rwmbOOnAC/kzDmbeRLge3x4Yz/5HR0u5vHGEvnTDbfFZVINXEp7CcsPNH4Nh3SHmJAsc
 S9BEuh5vMg44RMSM/YyL1L/C8UK3aAVxFBfH2tuV7CEKM7f3KYrj6mazfaM+hU31kBbxkrap09X
 jQRfio+r4oq10X4doCr+LIQ7ob6lXO/vjIyMHDj/mAzJryMBmfmMOBhHG64g/RxFyYro29nH8ix
 afIMC6gzJAXWuBvkLLgT10RiJN8ctXeyWdml9h3CguIMEEWd0NxgY9/eLEtpKB6Fi3aJ3bf6wEU
 RLNbhIVX0XctbX/M8/AkFQJqT+R3YymYMy7fDPVXBCxmpowmikPzhlFrQ4RY6CIsdZJvhiMBYro
 iN1IPX0vi6gHlTv5ZQQ==
X-Proofpoint-GUID: 5Nc4ICJmj_W4AE3omHQDvGrsFUQgoxz_
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9c66a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VTue-mJiAAAA:8 a=UPwjdVLwzqKTMXskr54A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=S9YjYK_EKPFYWS37g-LV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097
X-Rspamd-Queue-Id: 7DE704CBD3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7992-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,weissschuh.net:email,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/leds/blink/leds-bcm63138.c | 2 +-
 drivers/leds/leds-cros_ec.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index ef2e511438cc..45c0662df933 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -296,6 +296,7 @@ static const struct of_device_id bcm63138_leds_of_match_table[] = {
 	{ .compatible = "brcm,bcm63138-leds", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, bcm63138_leds_of_match_table);
 
 static struct platform_driver bcm63138_leds_driver = {
 	.probe = bcm63138_leds_probe,
@@ -310,4 +311,3 @@ module_platform_driver(bcm63138_leds_driver);
 MODULE_AUTHOR("Rafał Miłecki");
 MODULE_DESCRIPTION("Broadcom BCM63138 SoC LED driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, bcm63138_leds_of_match_table);
diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index bea3cc3fbfd2..6592ceee866a 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -249,6 +249,7 @@ static const struct platform_device_id cros_ec_led_id[] = {
 	{ "cros-ec-led", 0 },
 	{}
 };
+MODULE_DEVICE_TABLE(platform, cros_ec_led_id);
 
 static struct platform_driver cros_ec_led_driver = {
 	.driver.name	= "cros-ec-led",
@@ -257,7 +258,6 @@ static struct platform_driver cros_ec_led_driver = {
 };
 module_platform_driver(cros_ec_led_driver);
 
-MODULE_DEVICE_TABLE(platform, cros_ec_led_id);
 MODULE_DESCRIPTION("ChromeOS EC LED Driver");
 MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net");
 MODULE_LICENSE("GPL");
-- 
2.51.0


