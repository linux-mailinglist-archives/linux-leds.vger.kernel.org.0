Return-Path: <linux-leds+bounces-7851-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNxhI5gL72n14QAAu9opvQ
	(envelope-from <linux-leds+bounces-7851-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 09:09:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0DF46E1C9
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 09:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA6DD305A5F8
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2026 07:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B78039447C;
	Mon, 27 Apr 2026 07:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVqvXUsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JAk2px8n"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF474391E78
	for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 07:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273284; cv=none; b=KdYDMiandrQ/AkPttP0K/8isRjRfnRR38LbhZKQsu2LI8CDWZzF/PbU66YwupLjlJL8iTJsR1sPVLxw+w8x2r9kkdWJDnnnI/T2yGLty6Hm49LILT0ir3ILGi9BJpeag7Ro5YVkbje5gENIf58g95dkeZDHfs1AzHw4Mhb15Igs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273284; c=relaxed/simple;
	bh=kjcdk4gyESTkxvrrt4H4Wo3FfVUFQ0CvIV8fvMcf/BY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r7uVlNmBAhvYV/w7sEGCdim6sUQEywj1FsCbl3lfncD7xN2bZBTmoe+HJzwdTgg3YFSBERcdnBMzE/2vUmgSkBNsE7lZZ1pomKWzs37ZihI3G0D2YZwsntr+1F+ciJQiUv6bq+0fo9RAnXYES5ZeoxD9SyqOdb6JTleu9bHH+48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVqvXUsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAk2px8n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMwVRZ2685479
	for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 07:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8mgqVSEzus60boYOjgyGxvmPugcYCwqztgJ
	o7vLs038=; b=YVqvXUsgUETZHEjFqzP+V411yDwaBTiTBANWrdn2M39G3J6nn7o
	9aPavrpBCLoAmmPptAGZdFDss6+ce0/nLOZhP+pLVWNEPNr0d0adyEPFg2OoIS4E
	krvXtUTo5ZU9gAhPmmF7+9mUKsF7fD2Koz8mLcaZxpMLIck4u/Tl8Zr+1QUMS4Pt
	/qMOKa5CqX6GtgZIjNQlJxqD9mCHjo+hwkNEz7a+Os+BCoRB4qQ3Vi2gl3HuyIsD
	N/oYxGO2DZ+j2zVjsRQfCDT9HaKVQev3SnU2az0U1QsNxu1tlO55mikNbPBK0V5c
	JiqCRlo/2vTEMtve04+xyLCtj6bqiptqoAg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtcvnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 07:01:23 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f71e90581so7967453e0c.3
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273282; x=1777878082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8mgqVSEzus60boYOjgyGxvmPugcYCwqztgJo7vLs038=;
        b=JAk2px8nmqsUOQSeJaMtyKHHEa0dFquuOz6vFsAZqkQ0DzUy8e1CmPB5By2VNXhpdY
         +3H29vGruLrkVIw6qyidoYhxXPyqZyEgzoMyWzO2nYUu+5lFIlfPoDlzwUQLIcNjUT1S
         cAKLJik+/ZDmqEWJvSqCAHqekv1v04msp1xC3dsiH7DHUugtRbyHfExESjwf47M0JGJp
         6JrVpHMREI5TxB8RCA3gfoj+Q4SU13znMLVur3dCVlfQC0WUBvnSFCJX0xlKHKyjCEiO
         Uj3rcgdGPZzTUTHFgqwr/c0ml7qknRIia9Z6QDecF0NQ3tYV+FlORuUHKxZ8sghaItzU
         l4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273282; x=1777878082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mgqVSEzus60boYOjgyGxvmPugcYCwqztgJo7vLs038=;
        b=PC1PS1bbjJcBMbeWFraTzWko3ZsrFIIh3c3xa2raGfrA3SjIW83+YQiPcXIsVAYpqk
         6GhT2elTW5Ko2+nqB9QseyqULxl1koP7O8aHwxpz0Qqo/zjdQXgpgPAqP1uwSE1dVSZq
         jz2CsT/ji/l3/y4xn+sJMonD+OCJyuGvjctk5nz5+jRuq9iE9vzgmoDSihDlRjtSIN26
         /Avog63SiF0OnduqIKX6vO0ma5OIaXJZvQu7p6S0hYexInJykmM8RgGvUO+oemXECT+3
         yAHcniHK93ekC41caLvFi2HjQeu6HcQAYkFRfAq76fAcpIk9vAg6qBjX0bEre6AcXcOJ
         YmGw==
X-Forwarded-Encrypted: i=1; AFNElJ8uZ6BRuzbGf1c+lIuVFeU/uIpsYLnI8xE72UYyc6rpQ5+yevq07/n9c7mSISrJjOy0td3UB77ZozLd@vger.kernel.org
X-Gm-Message-State: AOJu0YwxlAuiy0mf7COZiaNu9puIXhEcX/HoTyRc8/X19wS1Gp7pIViP
	i5x15jRlM9z596UmFeGx5ozOVyBcO6ZCZV6c8YreEc/Pe1kEmpG6Q9Rjes5SLgUb2PYqDy8p4V9
	7tLxi1rpRme2gA7gUa+HWPHLZaAWFtmCjslaH8uWLOPzwB8K7TQNhXnW7VHiAlVGte6WrhsSi
X-Gm-Gg: AeBDieuePhkxsHgrHuYFpXI578jlPTxTgHbvK37lG7ASlGlVjcoFgZpCbwiXZCHAh4G
	EGvkkqs7Vs49tmEqFOkHS7gswrB7ivL+bXhljPpVL8lbaCz0JvLPoiycp5O165M9wbZNR48rLty
	Mj+Tg3WMy81LDfEp14QMZhNYohKg612d1ESFs7hnJOUMFPcQmd/Cz2xWeKzZOhT3gVq+HOJqNi3
	uUAWzrcI35uLix3N33PHqrm+MJ/qTBn1Lxs8uDcmFM474brlTXzFsb6sD37DDxrQoc+HXo+zx5M
	bMyd602zSpjQibx05ypu16za8ca80Lwxe2OPAQH3OJqLzw+T/+3StpladSuy5oiLiq1G3RDN1p8
	IQU8V+fKQLjGTw6quB+xVQvxslHJjbxSBy/ITU8R3X9upmPTwZ5oeO2x2rI2mvfckLFdqhuckDP
	7K8IeGxi5hXA==
X-Received: by 2002:a05:6122:a28:b0:56f:67ce:77cf with SMTP id 71dfb90a1353d-56fa5896a54mr18696496e0c.5.1777273281726;
        Mon, 27 Apr 2026 00:01:21 -0700 (PDT)
X-Received: by 2002:a05:6122:a28:b0:56f:67ce:77cf with SMTP id 71dfb90a1353d-56fa5896a54mr18696468e0c.5.1777273281370;
        Mon, 27 Apr 2026 00:01:21 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5a579bd3sm429074435e9.6.2026.04.27.00.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:01:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] leds: qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:01:18 +0200
Message-ID: <20260427070117.18363-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kjcdk4gyESTkxvrrt4H4Wo3FfVUFQ0CvIV8fvMcf/BY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wm9K42ki4ZhayUZEDyL50Zko/aWX64ku/t1U
 cqOEqy2m6SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JvQAKCRDBN2bmhouD
 10HkD/90RSU1p0SzTr5yr0FQ6o5UjbPZ5NIk/huprU7mm5gAZdjzQzfndBu+6riX1rlueR0u2pv
 Aqn5QchmkyiUWBIk9Im9uzqnEDYNsGDEueEEgkUG7i5AzrqK1zff1OWVdpomNcGLcGEF4WlysNw
 G90f/2LFD6S2qZPb2ddcXUlnBUEGPZK6HrqEL159XOsNCArIaE2i0+cvydJ92BxyFwaqEYtOT8X
 prmLIdsWVZpDdbTV8xlmczlQole1lqLlDWjC8Zl9p+/YmjYkk2Q+RzXzO8q9sUoPvDB6w6bcOzj
 LRmJmFGxd96ktMl5tPPF8tW88JPWy71xYF63iAf4IJPyzGQqUYkt7fVMaMx8yHPUN3TNpyA9pRi
 9ck0LXeh6YVz/9XjKrCkJsD39NGLeFXyGutQ9TsdnXW5nigHrnEkyP7R8+oxM9v5MsfBed89/Er
 a4KNgaiMIQcvGOJcvKcGXpVuYxgtiUx4KqoIsoR2v5758rIJdw7P9hRg+HLA9zFw771pQERZ3S1
 T6HKnNwaAvPaP3socQCMliCExKafeVQwnSLYSEAN//48znJd36yZVQIG6MJ5mmM0Fjp051U73D8
 KIxo2RHtnoP3SjAKNKgFV+lF5Swnegthqg0Rg/nCdrgKaYeOehdpvnn/YYyRvyvNWft0kAl5QIZ 2jf+GKqqtU4LGCw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69ef09c3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=g1_HqOy1rCh-aE303tUA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 9PE8g8x6S1PkpxKesfoQ0nJaPq7I4Ew2
X-Proofpoint-GUID: 9PE8g8x6S1PkpxKesfoQ0nJaPq7I4Ew2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfX9YxrQ2uyhqKW
 UWtDFXBMXV7xjTIeGikXyE7IBBVU00slocwCDogYiuoh0cP9l4Y9xfZ/MFxK/5iNe/ZwePUcs0p
 D8q2LVogH6rbaGW+7nnE1J78NG9cW7wDitWFVA6sFrcO+NRYLFr/AhIOB0HpRwqEjk+/2AIICa4
 gj09sRbr+ox6ad0rqhB3+Zu8sQAFdUTAKXfRRTtflOcWmNrtdnBK63GNv5LVEZ3ZJvv6lzxFuhS
 2wq71JlHGYjQQjvtYisc/MemKYWYcsSquDZ8pGMrdWA//HIJBt9SlsLat8qVlprTTMzMiSLGG/6
 c2HtX0wAJjs3g7BxYkT8UOXJCGPEKGfFgRJylVI9WZxMgbldUfbvui3ZENVxPG8zLRso1lZ/gnf
 3k2ushk4y4X/X6sWLKB1dxqdrOnfSg29L4lQI5Ex5DXZ5kF/aDnO2lLD9VatFai5PIixiHHCvs5
 FaXkdFA9xud4v18/VLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073
X-Rspamd-Queue-Id: EA0DF46E1C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7851-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	RCVD_COUNT_SEVEN(0.00)[7]

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/leds/flash/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 5e08102a6784..31c996651f2a 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -76,7 +76,7 @@ config LEDS_MT6370_FLASH
 	  will be called "leds-mt6370-flash".
 
 config LEDS_QCOM_FLASH
-	tristate "LED support for flash module inside Qualcomm Technologies, Inc. PMIC"
+	tristate "LED support for flash module inside Qualcomm PMIC"
 	depends on MFD_SPMI_PMIC || COMPILE_TEST
 	depends on LEDS_CLASS && OF
 	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
-- 
2.51.0


