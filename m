Return-Path: <linux-leds+bounces-7644-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCYCIQHd1GnzyAcAu9opvQ
	(envelope-from <linux-leds+bounces-7644-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 12:31:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D29903ACE17
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 12:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2FC4306B092
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2026 10:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E1D39B96B;
	Tue,  7 Apr 2026 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA5fkyJv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xfekwt8a"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DC03A5E67
	for <linux-leds@vger.kernel.org>; Tue,  7 Apr 2026 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557633; cv=none; b=phBuJNroUFSCXB5aPJNGMp3L99VrOZ09NNTGxIj3qRvAdM65tMg7udyQPDHqrCL4FMA98wvJF9iHR03lrCGf8L5ZjUZfyDeih8GqGBA/ojYeMM1ARtFVgsmqdOGKnXqKnp+QTPDqgXdrj1QZ32ZOdEG6Fx6b3zYU417xGLpQiqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557633; c=relaxed/simple;
	bh=C9jS0F/gOzlNdQxVxMT4uShJahv/zsqDh6pXRNRZRew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSnDpS6iXLu0OTBUusAoO2Ij+7I7Lqsd9woiCgzkuvMqqmE48AnY6zbX2UnYZmGLp0huaxzaItk/WIVALYzT+9gkyCvBrCd5C+Bv/DT+EZC2kHDVXK5w2Jg91YX0++9kt2bT9BR91TNXMOJMJPtfHZagVZql+XqyNJshcpoltm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA5fkyJv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xfekwt8a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376lNHI2550283
	for <linux-leds@vger.kernel.org>; Tue, 7 Apr 2026 10:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=; b=IA5fkyJvl9h0hHVo
	DOIu8XsmmeEekiKnN8+PaChhtIMkjVJrVtWxeZrrpt7ZF/wp/ioF7ruzzSnj65k/
	M8uJQwIELhJ+mzfmC7kyjuUucyTFOIvz7w8bIP1vsHSNi3W/EZgoQ0q7VmrEr/mP
	8v0gBDrC75hq6F15CNUPuzCDqP+jPDSWX/hTNRSC72gSLyTzFkCBZ0FFaK8Ng9iU
	7JP3L5GShHhKmbw48Poz8ofFge/x66g2b8guwEFLgfcmrBcudBfFX8w9tK/bfMDD
	GsP9LsKvQNTt+qpa+BXcD2GdhvoFmxjiCkSoxXc6v/ssbJnaa8+umywahI20laEK
	3vxbWg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea9kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 07 Apr 2026 10:27:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89eadc12c84so19444346d6.2
        for <linux-leds@vger.kernel.org>; Tue, 07 Apr 2026 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557631; x=1776162431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=;
        b=Xfekwt8a1/WtVoSxqscHnwGHaShjMhSX8D5BvTsTSJhEN9Sa9lWhFeBLYyRJJmGH4i
         mVyLbgm/nnpl17Pn/dhpec1o/yLz2QZHHqo3kVXPQuUSeF64NAF1aLROpAAcRrms6FyP
         MPcbmsKQ8RuUOaSVrApJsCz1YbgqBExTwNtFV0xRVBTGModShp1rtlHdT9ZXvDV4/LTp
         tg4kJKhKVjkSSstYGvcEEYJ7LPMnmGCh/r7MPpA5AVTQRM/N0pJXlxdFwbOroQI/iBoX
         VDajHDsH+qBqLxDIlJU1KZIwu8akAuXzvWZ2R0Z7ERe1JeeIrTr8o73PWOl5ZjA5ym2m
         M7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557631; x=1776162431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=;
        b=h8qF8Hw9OSXkLmYi3r1i3XE5G77mjmARr4HSBozhzEfnV8d4ORuexxSbBJ4r9tUdzX
         kHTj7+9uWWB8TuSb0kWd9uea9asAYRcrl8bs/0/nxpHgUITrGgIlYY9FyZ47fwMFkmb1
         V6G9pEnnKgQkHv86qhCs5G6G/tT5t0lQNAfFp8Engq5J4/deoaqNs72mAkg9cMjsyyb3
         xH6TI3y2Cjwcv0fg38PPHztHvP1fmgrkIohjYv1y9G5kk2VWGIBGhDxFa1VEHpajMSoC
         /D1QcWDZ2NKMeznH/xwkStgLhTgZMbF3Gex4eoFnmTjAY7XzHvZn4XwyOlAk1FmvMrIA
         Cf5A==
X-Forwarded-Encrypted: i=1; AJvYcCWXHO1ph+ZZpj/USIWD0nKy5Ip0TBSY2NQePjUdp4hRj5RQ6oQQcXZBXLvDvAX7PwkTiPBM0QApqVsR@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjegcSvmegRRUpG8x8vvS1kyTlL3HLHrSILrYhbGaugvTItYZ
	U7zZ7DSmSlq34HtG/67ELZ5kzYyAd/dL6Hzb9uEsETq37YdsIs4dD0c5AYmkRny5T+zuxrG5dFR
	3uW6EiKQSE6Wf08gKOijuP+R+KdiVNOW4YJ/GWRyn2eF0X53XYqnEey8rUhc+VRiT
X-Gm-Gg: AeBDietREaPMb+vGUhglMmxzdNLJTWOVpBI6dxHtG9DmmxwRJJrlOKBQUo9J7oazBzg
	CRV+0QjQv4NazxXI9ZrPraV/fnv3ksushBwqPfHj+xOLE6PDwE1Ze4H0rpB/pUHnCqMWKQ6qdRE
	tkiH5toBxNRNXfmto/4TQUTv4DPpzSLJdzyJqyBYxSzH0yYVPBiwu3MGxrVywPN7Co0GgElmSps
	MCbjNx4P4TF+fO9XYzlyi63cw6PtsHaHEBfzzogwCA+/0AW2ETTB4UdYt9ZEZN9yxJeDwytM8Sx
	brT9/2wE45V1c+He7gAL7H+OWvhDourjK60yNQlrxCqlMbOe0Zcosb16TzYX2oFFufVeH4Znhmc
	Dw3OyUO7gDEQPW9xGrmhRYzuV+yGjnWhrMzau8xCViG+/XaRMerddV/0ysfYdZypLREPBwtYayi
	uW1mA=
X-Received: by 2002:a05:6214:e4f:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8a6fefbcb68mr192040736d6.0.1775557631050;
        Tue, 07 Apr 2026 03:27:11 -0700 (PDT)
X-Received: by 2002:a05:6214:e4f:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8a6fefbcb68mr192040476d6.0.1775557630576;
        Tue, 07 Apr 2026 03:27:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm538210066b.40.2026.04.07.03.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:27:09 -0700 (PDT)
Message-ID: <42f82377-c30f-4cf3-a57d-9c85d9c54053@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:27:07 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4dc00 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8poMKPHdAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uSwIeAtNGuuqP4oK1qMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-GUID: flfqSKjlDHn_OD4GsC1LuXvd1ij93f1G
X-Proofpoint-ORIG-GUID: flfqSKjlDHn_OD4GsC1LuXvd1ij93f1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfXynZQZsSr2X1X
 To80yBJGjcQ49EwCjdEcWL2EyFs9L1Zy/5CRaFmsZzyZIAm4Wq41hnyajCM5bujQX/LrMmCKac9
 UERRyN9LDBeYgBSYpmViMpgx0RR9solwlloeKQMIy4SDMYP/IhtuoaugOTAKuoqphXlO3dcu6+g
 6CXhZBbhu+8HEBGlPztY+Rfdf1gsUFpYozGTKIdnRRTMquUASCOSnZAd/AEi2hjjAgedVLOLuUb
 hFjQ3gNfSGc96guOhvmNpdBTEPPPy7mfolzxgmlQiRsgv87mDyvcE/41FjwIxF44BeuelATA90D
 yoRw3nmO6pGV0yu2qoA0bnd3NJ9IL6EroZC5A0hZHGefod8M9GwOEISfpR97c6dNErbIJVTo0Qk
 rvLzav9rdyLAT883FfKu3sDUxNhiszfnPZHGcU/4XO1MP5JWlkb5HBGneGqoFrPbTN7FWIXHzvk
 suS8a/D05HZu2SCG8fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7644-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ssier.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D29903ACE17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 7:16 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add support for the notification LEDs on the HTC One M8.
> 
> Two LEDs are available, one orange and one green. Together,
> they both form a single notification source, so use a
> multicolor LED node to describe this arrangement.
> 
> Cc: Lee Jones <lee@kernel.org>
> Cc: Pavel Machek <pavel@kernel.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

