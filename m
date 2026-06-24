Return-Path: <linux-leds+bounces-8715-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SEKQIjmJO2qOZQgAu9opvQ
	(envelope-from <linux-leds+bounces-8715-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jun 2026 09:37:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3416BC381
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jun 2026 09:37:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FPEdM4V4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IN1Xu61U;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8715-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8715-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E330300468B
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jun 2026 07:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD892DEA95;
	Wed, 24 Jun 2026 07:37:22 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF7B25B091
	for <linux-leds@vger.kernel.org>; Wed, 24 Jun 2026 07:37:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286642; cv=none; b=Ppi7lnnmGO4g9vBek3NTFQDY2USteOEexQiZE0FLonG7ltmNWb/91piK25z9wtRBRbGqnwBzySkjFQURaJUdkoi2xGlOp3lZFlxY0PEy5xLN0ejlUJea04U9yCXsZCWBC7gw8r3hyonaXrmqSieCRQqoKN+8Cr/r3Ca+fm6BhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286642; c=relaxed/simple;
	bh=VjWAe6NQbcfXk7LekK5Gixkl8DdUeNBzf1JXLrhyZiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Yw67R1j7SKGpfhZiB9usHhRkekYY4oOgg7KAcijMRAOZTYrpmQKSzDjRF/2eOK4iPIOePlTmuDBstemoY5x6lvzN3Ofsk2IrXbUXTFMJYrCouB+ykwmZZuRcsHY2uuCWopl96Syl69eJDbsrRMSJeMJW1zYMn57AIjwNYy+Jn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPEdM4V4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IN1Xu61U; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tw2X1892324
	for <linux-leds@vger.kernel.org>; Wed, 24 Jun 2026 07:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YDXrOeIoY/asU8Ra+jix8l
	X0BVZIdHA63EMFM04C5Hw=; b=FPEdM4V4p2doI1ei3rfTNeKIC1UUvOLCZAFHr1
	X8ivpTm4jNakMjP2ODriE8pHsNrgjFziqGDl+6M3q/2iWmPtv5I6fp3os7yly2Lx
	kaYP7rlREsITHA4R8dy9xMYyyevMwAPI6DYiQkuskyapXgtQZ2XyCVXFGTcWIiYD
	OCQzEs0wA7H9JsElcqHiGruwa1S3SzswV7x6y2vK851o3CwkU5FJFge0spqsdSFr
	rTvILniteFGTvWMiGZ87XhZ9/1wT2kgFMP9jK6cAWpsXtTRH4mBUwOce8nJovGxs
	m9SZ98LGuRs80osk5Ubi6ct14AgyqIukHqcuUV4K+nhpuF3w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bf93h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 24 Jun 2026 07:37:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c108c19d4so892162eec.0
        for <linux-leds@vger.kernel.org>; Wed, 24 Jun 2026 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782286640; x=1782891440; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDXrOeIoY/asU8Ra+jix8lX0BVZIdHA63EMFM04C5Hw=;
        b=IN1Xu61Ub3slCoDc8Jdy3qZmCJQvJd0rsLjSoRwu5Qcq6H1/sAspI91K9I+irQqmdJ
         TE7JJ4lw2LVj/ostELL7Cl0CWRPlW4q1kMlRSUeAXEIaKtRFp84WlomzGZEwzxLYx+aW
         92tv9lijJ7ilh+Y8UWeUdqi7jmlIGns30xtyhH/acks0VeEXsAQ7y9tD9T7y81v46Blb
         YBlwCfJKUqRlEDD41GfRi2tVisRks7pcprO6sA9zzP4j154vZIgVMert+lC/iy2AGlu2
         yIeBW5MXqtyKVfFc82E6QgBqcn/h5dfCdl/owf6UkynhMxMv5afqljGDfqtT9G2+uRHN
         S/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286640; x=1782891440;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDXrOeIoY/asU8Ra+jix8lX0BVZIdHA63EMFM04C5Hw=;
        b=N/P4262DHJxHPXUCLeDXyx4abB0IHBWYGYdpEFrHm3kG5J1f3Yl8hmqAPvV6zJ785P
         e0Y+jrv+dwdycT0rncPLqPNEOuabAf0zd7VRQW6H2yvBAPLxHHn2ZdGibBbNo92VJ9FC
         t6a/UTuZT8dXNKCgBtnnqY8NWkcpis1xcidT405HZBRCA1/N/uKpJPK9gAoWkBhuaivn
         yyDqbT3AvqvThJDiW2h5MSFdIRQutDqPLP39qfnPOvFObICONkgbX5p26tVDzZIHyvLb
         Adt2LRn7LSJqwfC6wUqiQZqcSRqFQ89QqRnEus8BmH3Gidl8SnE5P3KVE4WZfkaKrkPZ
         VHmg==
X-Forwarded-Encrypted: i=1; AHgh+RoQQ5dnEdW6KgjV2Ayw7mVyGM48XG6AjklkwJjpHjS+RZvKmaaRBcNgaJGVHRo08A+aCuQrNzCk0gpm@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmkERcwWRWz/cMYsvhhUFeOgyB808Q6Hrh0SDaQUXHKhTxzVq
	y+Ftr/zaDKJG2NcxK4BRJgBLTV0sm1M27q4p8VIoXApWTIIwlvoET9rXbJCB1ma29HlRJ7xnG41
	cHrPA5vOhaQnz5rbBhc0If6HsHPqKXenXTOv9tYNQ+VYJMxD3muaG6uVvoz+RXSJJ
X-Gm-Gg: AfdE7cknlkVAWKoA3m4jAzn5xNqGqiJ1kA1kPr0dPrxY0HgSQ3WmlnBIwtHAFyFUDBE
	7aSlSNp1S1eRXz9YhT9xAihsmnc7PP9pOiNQjelJdEgYnFLAN0j2KHLTMRcc8qoI3TgmzUvp4rR
	gvSdHamOb7ARLiWaRXGtLwk4dPmiw/nQKExA9u8+9FWBAS+DrSwBQoNrwt5oZPWZJ7idSBAizsh
	50K7eSrLP62eSFG0qetevdSirGv1n4lUUGbOn/tTZO/XRirWvUdoSv768KdjBndkgwU5OPmNmJo
	bt+8kHa4OSomXPKzpg48qEow0whh0dzlCeoNHwwYSLAxjwzT3DNhqMG7qRfbpB0UH7eql6K9bel
	e6vo04+mG9dg5uSVE3Ie3agGAmShAxFBTUumuALMuuc54WyDhTHfC2ZaOoGAVUz8=
X-Received: by 2002:a05:7300:7b91:b0:304:bce9:25fa with SMTP id 5a478bee46e88-30c69184a6bmr2276639eec.4.1782286639593;
        Wed, 24 Jun 2026 00:37:19 -0700 (PDT)
X-Received: by 2002:a05:7300:7b91:b0:304:bce9:25fa with SMTP id 5a478bee46e88-30c69184a6bmr2276620eec.4.1782286639044;
        Wed, 24 Jun 2026 00:37:19 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c6d5717a2sm2432763eec.0.2026.06.24.00.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 00:37:18 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 00:37:14 -0700
Subject: [PATCH v2] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACmJO2oC/42NTQ6CMBCFr0K6dgh0SoOuvIdh0dYCNZViB4iGc
 HcLXsDNS76X97MystFZYpdsZdEujlwYEvBTxkyvhs6CuydmvOCykEUFfuwgdhpM8CGCVl4NxkL
 r3lBzgVKKs9ItstQfo032sX1rfkyzflgz7YN7onc0hfg5zpdyz/3zs5RQAnJEKYRCrKtrIMpfs
 /ImPJ95EtZs2/YFFGqAr9sAAAA=
X-Change-ID: 20260605-lpg-rgb-color-balance-fix-82436649abf3
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782286638; l=10077;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=VjWAe6NQbcfXk7LekK5Gixkl8DdUeNBzf1JXLrhyZiU=;
 b=nZvLLefDztZqIijjqJwhFUZsr8W/OhtJWFHH3zNkCn4pozdZ1aiMVqZaDI/4YMiWKMDlNgxod
 U81SNCdCEhlColcLzH18P33fBzetXiAASgtMtBDZuhGKBclBRhJ44fB
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3b8930 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=q7j7SU0M432TpuN6ahQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: XjsNYguUQDNG9BtC0zN2mheiOeTnVgI9
X-Proofpoint-ORIG-GUID: XjsNYguUQDNG9BtC0zN2mheiOeTnVgI9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MSBTYWx0ZWRfX9YIpYUzkikbx
 uX9k+40rdo1APzpLXd3VoAHRT+z551B94Xho9xd5R2zhCkBSCVBG7ZDaZ5q472XUph1DQtwinJB
 i9XLRzX6hKrBxlN7W2tn54nJDJseiFM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MSBTYWx0ZWRfXxeKgTKTKSrHv
 PdTiyONocjSvj7gGDbEb9ZKEwwVr/g/cIMFb8NslIY9RAsrdpaH42RD3KRTPIr9A4l18Gsv8XfD
 vApoLUDjWC8lK5jmC3ON6uwH+uKls9JPg5HHNDPy9rRQ/qIacTDQ0D24pDRiTA1pK/UWIw0sWHZ
 YAwfwGEKm+4VbSypWGpv8tYP3AhUb+2o/qEspaxK5UwBL3ZHfzTPg0BWsLS9Ww8ztP7P+M/PAu4
 ZWSLUqxcVsNH6N6mEp+JLfjz8WNBrMNJw7cAeE+qn8pAA/Uoun8XkZg2QVXIEqvZUg8FJh8CSgO
 EZA8UfwIbm6fe7tauU0xfgO4SjyGU1hG1IYrs1E1+nLkxIK+rtNl5usWMOfEbe0D+R5rwGAPfLq
 qsYug9lHTA7F1wikPlwfnNmXCXK8kHCllJx58MkVFj9TTLfo+F3YbQ3l01dv8lG6XSgA08RJmlE
 2NJkLv4/IAyro2fkXFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8715-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,pattern.data:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F3416BC381

Currently, when the LED is configured as a RGB LED or a multi-color
LED device, the same pattern is programmed for all LED channels
regardless of the sub-led intensities when triggered by HW pattern.
It results that the LED device is always working in a white-balanced
mode regardless of the intensity settings.

To fix this, scale the pattern data according to the sub-led intensity
and program the HW pattern separately for each LPG channel.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
- Change to use tab for the indention in the comments of 'struct lpg_pattern'
- Remove the comment in lpg_prepare_pattern() as the function name is
  self-explantory.
- Link to v1: https://patch.msgid.link/20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com
---
 drivers/leds/rgb/leds-qcom-lpg.c | 167 +++++++++++++++++++++++++++++++--------
 1 file changed, 134 insertions(+), 33 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index d7d6518de30f..daf796df5706 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -148,6 +148,24 @@ struct lpg_channel {
 	unsigned int pattern_hi_idx;
 };
 
+/**
+ * struct lpg_pattern - The LPG pattern normalized from the LED pattern
+ * @data:	The pattern data array (caller must kfree)
+ * @len:	number of entries to write to the LUT
+ * @delta_t:	common step duration in ms
+ * @lo_pause:	low-pause duration in ms
+ * @hi_pause:	high-pause duration in ms
+ * @ping_pong:	true if the pattern support reverse
+ */
+struct lpg_pattern {
+	struct led_pattern *data;
+	unsigned int len;
+	unsigned int delta_t;
+	unsigned int lo_pause;
+	unsigned int hi_pause;
+	bool ping_pong;
+};
+
 /**
  * struct lpg_led - logical LED object
  * @lpg:		lpg context reference
@@ -959,23 +977,16 @@ static int lpg_blink_mc_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
-			   u32 len, int repeat)
+static int lpg_prepare_pattern(struct lpg *lpg, struct led_pattern *led_pattern,
+				u32 len, int repeat, struct lpg_pattern *prep)
 {
-	struct lpg_channel *chan;
-	struct lpg *lpg = led->lpg;
 	struct led_pattern *pattern;
 	unsigned int brightness_a;
 	unsigned int brightness_b;
-	unsigned int hi_pause = 0;
-	unsigned int lo_pause = 0;
 	unsigned int actual_len;
 	unsigned int delta_t;
-	unsigned int lo_idx;
-	unsigned int hi_idx;
 	unsigned int i;
 	bool ping_pong = true;
-	int ret = -EINVAL;
 
 	/* Hardware only support oneshot or indefinite loops */
 	if (repeat != -1 && repeat != 1)
@@ -1001,9 +1012,9 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 
 	for (i = 0; i < len; i += 2) {
 		if (led_pattern[i].brightness != led_pattern[i + 1].brightness)
-			goto out_free_pattern;
+			goto out_free;
 		if (led_pattern[i + 1].delta_t != 0)
-			goto out_free_pattern;
+			goto out_free;
 
 		pattern[i / 2].brightness = led_pattern[i].brightness;
 		pattern[i / 2].delta_t = led_pattern[i].delta_t;
@@ -1016,7 +1027,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * through the entire LUT, so prohibit this.
 	 */
 	if (len < 2)
-		goto out_free_pattern;
+		goto out_free;
 
 	/*
 	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
@@ -1073,13 +1084,13 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 			 * specify hi pause. Reject other variations.
 			 */
 			if (i != actual_len - 1)
-				goto out_free_pattern;
+				goto out_free;
 		}
 	}
 
 	/* LPG_RAMP_DURATION_REG is a 9bit */
 	if (delta_t >= BIT(9))
-		goto out_free_pattern;
+		goto out_free;
 
 	/*
 	 * Find "low pause" and "high pause" in the pattern in the LUT case.
@@ -1087,20 +1098,48 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * duration of all steps.
 	 */
 	if (lpg->lut_base || lpg->lut_sdam) {
-		lo_pause = pattern[0].delta_t;
-		hi_pause = pattern[actual_len - 1].delta_t;
+		prep->lo_pause = pattern[0].delta_t;
+		prep->hi_pause = pattern[actual_len - 1].delta_t;
 	} else {
 		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
-			goto out_free_pattern;
+			goto out_free;
+		prep->lo_pause = 0;
+		prep->hi_pause = 0;
 	}
 
+	prep->data = pattern;
+	prep->len = actual_len;
+	prep->delta_t = delta_t;
+	prep->ping_pong = ping_pong;
+
+	return 0;
+
+out_free:
+	kfree(pattern);
+	return -EINVAL;
+}
+
+static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
+			   u32 len, int repeat)
+{
+	struct lpg_channel *chan;
+	struct lpg *lpg = led->lpg;
+	struct lpg_pattern pattern;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int i;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
 
 	mutex_lock(&lpg->lock);
 
 	if (lpg->lut_base)
-		ret = lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 	else
-		ret = lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store_sdam(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 
 	if (ret < 0)
 		goto out_unlock;
@@ -1108,12 +1147,12 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
 
-		chan->ramp_tick_ms = delta_t;
-		chan->ramp_ping_pong = ping_pong;
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
 		chan->ramp_oneshot = repeat != -1;
 
-		chan->ramp_lo_pause_ms = lo_pause;
-		chan->ramp_hi_pause_ms = hi_pause;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
@@ -1121,8 +1160,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 
 out_unlock:
 	mutex_unlock(&lpg->lock);
-out_free_pattern:
-	kfree(pattern);
+	kfree(pattern.data);
 
 	return ret;
 }
@@ -1144,23 +1182,88 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
 }
 
 static int lpg_pattern_mc_set(struct led_classdev *cdev,
-			      struct led_pattern *pattern, u32 len,
+			      struct led_pattern *led_pattern, u32 len,
 			      int repeat)
 {
 	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
 	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
+	struct lpg *lpg = led->lpg;
+	struct lpg_channel *chan;
+	struct lpg_pattern pattern;
+	struct led_pattern *scaled;
 	unsigned int triled_mask = 0;
-	int ret, i;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int scale;
+	unsigned int i, j;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
+
+	/* Allocate buffer for the per-channel scaled pattern copy */
+	scaled = kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
+	if (!scaled) {
+		ret = -ENOMEM;
+		goto out_free_prep;
+	}
 
 	for (i = 0; i < led->num_channels; i++)
 		triled_mask |= led->channels[i]->triled_mask;
-	triled_set(led->lpg, triled_mask, 0);
+	triled_set(lpg, triled_mask, 0);
+
+	led_mc_calc_color_components(mc, LED_FULL);
+
+	/*
+	 * Each channel gets its own LUT block scaled by subled_info[i].brightness
+	 * so the pattern respects the configured colour balance.
+	 */
+	mutex_lock(&lpg->lock);
+	for (i = 0; i < led->num_channels; i++) {
+		chan = led->channels[i];
+		scale = mc->subled_info[i].brightness;
+
+		for (j = 0; j < pattern.len; j++) {
+			scaled[j].brightness = DIV_ROUND_CLOSEST(
+				(u32)pattern.data[j].brightness * scale, LED_FULL);
+			scaled[j].delta_t = pattern.data[j].delta_t;
+		}
+
+		if (lpg->lut_base)
+			ret = lpg_lut_store(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+		else
+			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+
+		if (ret < 0) {
+			/* Free LUT slots already allocated for previous channels */
+			while (i-- > 0) {
+				chan = led->channels[i];
+				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+				chan->pattern_lo_idx = 0;
+				chan->pattern_hi_idx = 0;
+			}
+			goto out_unlock;
+		}
+
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
+		chan->ramp_oneshot = repeat != -1;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
+		chan->pattern_lo_idx = lo_idx;
+		chan->pattern_hi_idx = hi_idx;
+	}
+
+out_unlock:
+	mutex_unlock(&lpg->lock);
+	kfree(scaled);
+out_free_prep:
+	kfree(pattern.data);
 
-	ret = lpg_pattern_set(led, pattern, len, repeat);
 	if (ret < 0)
 		return ret;
 
-	led_mc_calc_color_components(mc, LED_FULL);
 	lpg_brightness_set(led, cdev, mc->subled_info);
 
 	return 0;
@@ -1174,11 +1277,9 @@ static int lpg_pattern_clear(struct lpg_led *led)
 
 	mutex_lock(&lpg->lock);
 
-	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
-
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
+		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
 		lpg_sdam_configure_triggers(chan, 0);
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
 		chan->pattern_lo_idx = 0;

---
base-commit: 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5
change-id: 20260605-lpg-rgb-color-balance-fix-82436649abf3

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


