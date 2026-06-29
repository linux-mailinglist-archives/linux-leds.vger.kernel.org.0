Return-Path: <linux-leds+bounces-8751-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VGerJaFCQmrE2wkAu9opvQ
	(envelope-from <linux-leds+bounces-8751-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 12:02:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6A6D8948
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 12:02:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HBHmTRS3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DlFgINB9;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8751-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8751-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32106310D76A
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 09:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DF93C063C;
	Mon, 29 Jun 2026 09:51:11 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFDF3B7765
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 09:51:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726671; cv=none; b=EcxEEQIvPlqHyxLpwOf5TR2BTNQTerNiBM2yLe0yDhv1SvELOy3jpnwEEZCfOCjurKif61yR7lnl7CfAYjwdPMi4KCIaq4vo5JfWhJv2onegcxQ7YJNocpbebwQ0aZDdwWZ4v7CHvMBTUZZYe6puNUdTiSmsHrRtExGSDrE0KsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726671; c=relaxed/simple;
	bh=Iz13SuQvY71vEyrFYz9keltrPKz+97Q77cmh8SsKMFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b/BytMmahsPNEkkptipGX+GExG0ebVsufWNFxE7sYTa8T5uUNjQEPESL4v8O6a5PV35aW/7rUYqczhLBuFlvXUaqCL0U+DDE3cWiBQq4515oz3LndX+6m8ML4bY1gfdCjTzVuB1hyZ0XmH4H6zN2NcqzumKcF9aru3DrnLxy5G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBHmTRS3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlFgINB9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8OBVC2348369
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 09:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9fjyVXg2cFwV+a29VtfcQe
	10Evmy88Taq7ub5JWYYcg=; b=HBHmTRS3oXnF3rgt7x7NgRkJRht3PY3NqlpF6J
	ATLmCAEtbiLbXoA6eDfX/JgWILgtjxCvwVs36m4/kSvZnYk3STJth6lffpwnujwG
	9/NEWDbtJ6FLI0AfyY/o5pfbCL/A98fuENJm0r1O6nbzqg0JAD6+tEc/zGRCQ5BZ
	YKf1Njh456n06ls5yI020b5MK47Bhto7aSSDKVnFmNf6Axq+b9EHv+RrT4rfbGk4
	0pkxTElPbwXNa7o3qm8A8shOE5NG1tIKw93Vnn8hhaqtQfoh0RYo9NbMlvRa8ucK
	W1B93O8dnRzRTdYfCfPH8aYszFLrK31yZ9OyzMW80gxa6J+w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0cpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 09:51:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso4977907c88.0
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726667; x=1783331467; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fjyVXg2cFwV+a29VtfcQe10Evmy88Taq7ub5JWYYcg=;
        b=DlFgINB97PM8pbW7kOBTvoj3MVhY+xArR4QY9WItMFyOLJy0w2iHrJ2EJ1sFCgJCa9
         b3a7jEJ1MHVRsLz4WDI5lhjklqIxNEym3L4FVtJczndDdrdiZqlYPBPipQLGUnhNoXXi
         MqML1RWOe3zKwoGrXoEd6oh7iwC3zYgfDlFFAxR6XuKFYRZ9zBPg9nScQudnXcnbr41u
         IsHvq0+npJOnkDVMXEUIa5ehWPUpvPNRlWxqvUvee61R6HkXdz6sS8hjWsT8pxVvR9fE
         fEdstF8pnmOUOTcIdliJdpHieUEjZUl478e+MpW215GnsHxjqLvizooPcJphXOrGUyt/
         5lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726667; x=1783331467;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fjyVXg2cFwV+a29VtfcQe10Evmy88Taq7ub5JWYYcg=;
        b=OfwMRlLako43PHiDPWZd7/z/rQk/GRCFI/B0pAh4HfNcAI2qLV/j3V4W8WE0aJ53jU
         PT0mtSZNVYUyOsLTPzrH7lRvQ3ZcCuEYemxl4U3j7tMigyfWIMv13uXAkU5B+FWZepys
         dVhIZzXrm5uINvYvWMyR8QaNhEvNMUgnizvBuOnr7IHW/+LMObhHxYpqjb9ccrCxjOaH
         gqOqT3nc7yFBGZj/DkRmQ7nke1oCFz4v0sW5ul/vJPeGZS1INZ/W21K4XK8zwVeMiflw
         YYz3k/YGbo+BxXsmXIrYc69zmua6AeEmG1kAfdDVju7+7dYqlENh+fjSpt6UHDqCnU6c
         w6FA==
X-Forwarded-Encrypted: i=1; AFNElJ9yEp5SExUmBM/ez1UCAviUucMFinu0ajmFUUnLIOSgDNwiSKfN1TBk3qpZ+41mckJpX/V9vVp/1Llv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2qpMJHP9PMTAFOGL33tC+FvUGz31huFjmiRk3Uuyg/UHhPPme
	zAF6DcuEAeBiKCsLyKNZEBdDgAT8jnZlXYgGsHdxJ6iPTcp7y9FQH44wd0v6C08ivDvDKsDDsJw
	w/JX8aUMR6FXGImT9ICPbzpQm43IxpwTmRr+wRIsuZisgfZXSnTSOQQCIs+84xF4X
X-Gm-Gg: AfdE7cmpW9qTxZ0Zd2nQLNG+FOvB2BXMGz/y1nV4RvyEZ/S2p2OWC4E3POWtiNF6U23
	r6NxQZgyYJjgoWwXWxDVjpiupBcmu6fwxWE0l8olblPmTzlheT0VNdL2EUiJQq1IXzQwHmLyE2f
	4JyErNC5o8/W3Vz9T4lskOmflSkM6vB0nJ/+eN/i4ijoSJTdAMpbPudIKEBZxK90DhUPElJqkMp
	gAZbwfICHQbx1P8HWV+etE09ypj7KXkU+U14bJw/8zzbowhSGz67pBpThqhyeC39KoIamBq4tt/
	mb7FOkQnV+dCIsRIjvO65UpaFHZl345xVsWPU9lqHupeN1fZ0yYUet/bp+ZZcUgXUGzf3BbLP09
	1C152ootBtWKpSoN9vQeBQ9MFzABZkWM31gLCrfbn/4RgQZViHBrlwerzfVeq/P4=
X-Received: by 2002:a05:7022:ef08:b0:139:ed59:4b8e with SMTP id a92af1059eb24-139ed594d8emr6030594c88.50.1782726666563;
        Mon, 29 Jun 2026 02:51:06 -0700 (PDT)
X-Received: by 2002:a05:7022:ef08:b0:139:ed59:4b8e with SMTP id a92af1059eb24-139ed594d8emr6030570c88.50.1782726665937;
        Mon, 29 Jun 2026 02:51:05 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139eac62642sm25007204c88.10.2026.06.29.02.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:51:05 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 02:51:00 -0700
Subject: [PATCH v3] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-lpg-rgb-color-balance-fix-v3-1-17796a06d799@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAANAQmoC/42NQQ7CIBBFr9KwdhoKlFRX3sO4AKQtBkuFlmia3
 l2oGxfGuJnkTf5/f0FBe6MDOhQL8jqaYNyQgO4KpHoxdBrMJTEimHDMcQ127MB3EpSzzoMUVgx
 KQ2se0BBGOWd7IVuKUn/0Or039+n85jDLq1ZTFuZEb8Lk/HMbj1XO/bMTK6iAEko5Y4LSpj66E
 Mr7LKxyt1uZDspzkXwICfslJEmocCWxrrESLf8iXNf1Bfl3Cv0sAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782726665; l=10248;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Iz13SuQvY71vEyrFYz9keltrPKz+97Q77cmh8SsKMFI=;
 b=MNQoc3bGMnfGz9xTgRDYytEpQasBlrbvPs4g9mhBAiBLMy7Q2NzmuyYlAyoZF+loRXN6jz1ri
 e/f1pVVHtufCW760S0c/vQfDy0QqnhS7oYQsT7+qNpIOX26h9prxUjq
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX41w5OVuvqaB9
 LMBXBd/CqA0cSt/0+CiaUH30Fh47Tkd8Y0dkky8YTmQ1ak+SvLPAMpmTaq7zIpPu/ga1DRWZcYc
 v2G2JJxYdb+2AtWS7BUCsJ7FEDsJCXY=
X-Proofpoint-ORIG-GUID: ylwQbwuxBROZd-Q5okY2TSfJGx5QOg5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX3ya5XFdzAsIJ
 cOm+VvBsdLw54KSTrRN7dk4COVbUsTvi5e6YwHyBAoWKO4OA8xTXiU3aKVVagybpEBvA3F6HUvu
 8aEQVs7WxgT/p41gnfwP1hVagwJ8JPAfYS8pP08ia3bc4ifHeJqFUm3t1BDGKfqDcVuBNhclGla
 PmK/4u/MVfKaJuKwHjQRO5SJNTYFm+h4zAmJPBWgX+KS1ad5TtUH60wSyCSsHytVHkLzna3/VH6
 Nwx0CDki+CDc/8GKrgCey+DgxauepInqoJf67peCfEqWWh2J0pTAB7AqmP3g9quvjibJefs284K
 8C6WQZTjC8GrgeqBX/vFWEKVVrGVLWgw/SHe/dI1j/cdrFvNnfU7GTsa5Ldrg0jxAruA5b2L9eM
 dtQB7L3JV3e/kMEQGepQEvlgSOj243TCA6T31qpBGV2C0ERdJjlf5BbjVL2ryZrfSsoNFCj+/eu
 lqJNBmCJ+j8G1tIkYBg==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a42400b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=q7j7SU0M432TpuN6ahQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ylwQbwuxBROZd-Q5okY2TSfJGx5QOg5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8751-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,msgid.link:url,vger.kernel.org:from_smtp,pattern.data:url,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6B6A6D8948

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
Changes in v3:
- update to use __free() and guard(mutex) for easy cleanup
- Link to v2: https://patch.msgid.link/20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com

Changes in v2:
- Change to use tab for the indention in the comments of 'struct lpg_pattern'
- Remove the comment in lpg_prepare_pattern() as the function name is
  self-explantory.
- Link to v1: https://patch.msgid.link/20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com
---
 drivers/leds/rgb/leds-qcom-lpg.c | 173 ++++++++++++++++++++++++++++++---------
 1 file changed, 133 insertions(+), 40 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index d7d6518de30f..c3fe8de33242 100644
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
@@ -959,23 +977,15 @@ static int lpg_blink_mc_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
-			   u32 len, int repeat)
+static int lpg_prepare_pattern(struct lpg *lpg, struct led_pattern *led_pattern,
+				u32 len, int repeat, struct lpg_pattern *prep)
 {
-	struct lpg_channel *chan;
-	struct lpg *lpg = led->lpg;
-	struct led_pattern *pattern;
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
@@ -995,15 +1005,16 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	if (len % 2)
 		return -EINVAL;
 
-	pattern = kzalloc_objs(*pattern, len / 2);
+	struct led_pattern *pattern __free(kfree) = kzalloc_objs(*pattern, len / 2);
+
 	if (!pattern)
 		return -ENOMEM;
 
 	for (i = 0; i < len; i += 2) {
 		if (led_pattern[i].brightness != led_pattern[i + 1].brightness)
-			goto out_free_pattern;
+			return -EINVAL;
 		if (led_pattern[i + 1].delta_t != 0)
-			goto out_free_pattern;
+			return -EINVAL;
 
 		pattern[i / 2].brightness = led_pattern[i].brightness;
 		pattern[i / 2].delta_t = led_pattern[i].delta_t;
@@ -1016,7 +1027,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * through the entire LUT, so prohibit this.
 	 */
 	if (len < 2)
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
@@ -1073,13 +1084,13 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 			 * specify hi pause. Reject other variations.
 			 */
 			if (i != actual_len - 1)
-				goto out_free_pattern;
+				return -EINVAL;
 		}
 	}
 
 	/* LPG_RAMP_DURATION_REG is a 9bit */
 	if (delta_t >= BIT(9))
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * Find "low pause" and "high pause" in the pattern in the LUT case.
@@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
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
+			return -EINVAL;
+		prep->lo_pause = 0;
+		prep->hi_pause = 0;
 	}
 
+	prep->data = pattern;
+	prep->len = actual_len;
+	prep->delta_t = delta_t;
+	prep->ping_pong = ping_pong;
 
-	mutex_lock(&lpg->lock);
+	return 0;
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
+
+	guard(mutex)(&lpg->lock);
 
 	if (lpg->lut_base)
-		ret = lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 	else
-		ret = lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store_sdam(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 
 	if (ret < 0)
-		goto out_unlock;
+		goto free_pattern;
 
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
 	}
 
-out_unlock:
-	mutex_unlock(&lpg->lock);
-out_free_pattern:
-	kfree(pattern);
-
+free_pattern:
+	kfree(pattern.data);
 	return ret;
 }
 
@@ -1144,23 +1176,86 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
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
+	struct led_pattern *scaled __free(kfree) =
+			   kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
+	if (!scaled) {
+		ret = -ENOMEM;
+		goto free_pattern;
+	}
 
 	for (i = 0; i < led->num_channels; i++)
 		triled_mask |= led->channels[i]->triled_mask;
-	triled_set(led->lpg, triled_mask, 0);
+	triled_set(lpg, triled_mask, 0);
 
-	ret = lpg_pattern_set(led, pattern, len, repeat);
+	led_mc_calc_color_components(mc, LED_FULL);
+
+	/*
+	 * Each channel gets its own LUT block scaled by subled_info[i].brightness
+	 * so the pattern respects the configured colour balance.
+	 */
+	guard(mutex)(&lpg->lock);
+
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
+
+			goto free_pattern;
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
+free_pattern:
+	kfree(pattern.data);
 	if (ret < 0)
 		return ret;
 
-	led_mc_calc_color_components(mc, LED_FULL);
 	lpg_brightness_set(led, cdev, mc->subled_info);
 
 	return 0;
@@ -1174,11 +1269,9 @@ static int lpg_pattern_clear(struct lpg_led *led)
 
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


