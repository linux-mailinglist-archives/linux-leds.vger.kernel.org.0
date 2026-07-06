Return-Path: <linux-leds+bounces-8935-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nV5tLWfTS2reawEAu9opvQ
	(envelope-from <linux-leds+bounces-8935-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 18:10:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 108387130B8
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 18:10:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k/gnqbuk";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TEP2SqSx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8935-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8935-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08CC63667945
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 15:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84183E008F;
	Mon,  6 Jul 2026 15:42:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B843A6F17
	for <linux-leds@vger.kernel.org>; Mon,  6 Jul 2026 15:42:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352541; cv=pass; b=ri7HW8XJCs8gMM3ix4jbYPLCr/rjkZA1KA+foNkU7KfK1tZdrKM6+vWwXebM6wEKg7MiSBBTHa++XXdcb3JP0mnE8AOsdibRhzOadD/d810TFos28xtLWfiifoQLyhuRFURTMEdd+2k82RZ2Bm2VFnU8milMm77fWYy89uzk8ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352541; c=relaxed/simple;
	bh=vxiTjmdRKEJcgCHcsh+xRM1T9V6SfswY5UBXy+kog54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fd7H3LclEP8u9DuyqOsNHsBltVJDLU8LmqoNsHI/ZKv9cXvxOgoyjWQsdB4Z2sNZ44zfDgkWVi0QKOpDhfj0QKVrFT/ATyIiWRLqd+qoy6lvCwntoiq2AQnF3JkkpRkZvRh/dTwYWynOpw00skTMlaDv4st00ajnB5eR7Bu16i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/gnqbuk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEP2SqSx; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBhb958653
	for <linux-leds@vger.kernel.org>; Mon, 6 Jul 2026 15:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=; b=k/gnqbuk0Trr8pfa
	jkXx0HGDlJo1mkiT4zQYwQyH6hINsliO5RL5vxgjAvw9DgHGfNlnP3ndAK7CLHwG
	d+3cGDzsBka7pDwGWw8nerKqVeDmZjVQxRNID1hQsIkgMSiueW65iTFDq+RfBn9V
	hno83aRMV/skzuMr0hWtXdBX4t4t6aBagG8jokO7wQWBS4uM4HOUY6rZUMLE1D1s
	XzvuvwyT7Gim5nbfANBUwvhK4dUF2b2WPdk875p6k3yHGotHka1FQSp6a7xULIkH
	d2M5BCcOPhkFL5EP1tC3NOR9FMmAAji6UjS2BYMGKDgLnoZKOc+AC2Zq/op/HYhb
	qD1lOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9a1y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 15:42:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915d3261c5cso276094785a.3
        for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 08:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352538; cv=none;
        d=google.com; s=arc-20260327;
        b=CD/GSXZ1YypVcRAmm/iptXT1JeEpe5B6Ny3hZyPZybOL7BAnRtmmqHqagRAeceq300
         vw0rYRhXriA3+nUQTTLhwsP80X/nMskLGFvyKCc7B3A+GJGTBTSJw3rTxCWpGao/xFti
         YKEJLTlOYNA8fMR1RWHk9sJqO+ID3ymvGLFuAsQOU7tpUrMb9pIu98Epi9inD1wfL3bK
         UKQMSMmJtQgIleRwxZzy5B/T01zfH+69Zd52RcMAMoonQd5l5m/K4o7LmB99ykjguI20
         cAlTrmpVuupnegIsaaDTouUpWr8WVzjGNsm0XG1+E3P97G7YHfGkoU5DAGGEKKNBX57g
         Eo1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=;
        fh=onyiWV+xg9xuFaRITSWaHRSom2UrxGicYfNTw4mws6g=;
        b=gyH5PODx8SXXffBacySTe2wEvQaJXwLy9X8yfw4krTOi+xOoG6YY4O0W1XVlo7SnBy
         qG1EgsT/o9rEN17FVZxxac/HjV/8+a9X394C6L8/qnOHQx1/Px9HMZ2gCy79AOKDaBCI
         1LjgWFBJIvIsQSmwOFj9hkDdUK+aH1k9r+U5oTONCw98Na7zS39FpZ1gumRoUgtimTsC
         /l+2bZYhH/eeIoH+sXuElwhgCMCYVXvE/Up4Tvx8Y66lwOGbH3CcfBS9D8udT5z/QxYF
         AXVyooi+WMwulzj5eAsXRBnvH+WEfCAsVjDPkm/AX++xjbVc+GY9l7H0dfPt+atR23VF
         LCwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352538; x=1783957338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=;
        b=TEP2SqSx0Fe6LY/ABPe77gTpTcux+D0IJE3u2uy9EXBhoW1fQjIG9igFLqEzWDUoc2
         T01Ak5upLnG29b9N/JQkS3dL+JgBgLL9brYEhSDgpzW8zW86toGBOuoEZBrxXpsbUM72
         WC7O0UYD0qdkYQON11hcvrwu4C5Uc25qMk5OEHWD1NCeafnbfjrsYl9BTJ39xH6o4oCx
         7Mnrqr7kNwKVlYVWyJEyqujRct+Qghwn0bycMuHXhsgr7azOSCUlpPP7uvsiCheMnLYx
         vt6g2devQ1lepeiMpS2o9k/BMnKkYbflg1sDtVWoZPy9aDMoT+OF8AQPK/8WZ8ZGditm
         CBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352538; x=1783957338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=;
        b=L0PZ8YwYrfA7fAzWeBLTwEMmB6NVE94YWI0udCDc29ymsZov47p1mtvITjz/CsSY3T
         Kq/3aOTfWbqwWj7/bHz3vRq0jx6OPht22LVgrXqY/q2HdrX4AHN8HzkxgfPyW8kcrAMS
         0tF+zqUzELlVO9+lkZFURaQv5YZBRv27hWwqF6sSYffo8ZRD297d5jeFobsGpQNx/0o0
         WaY6Qe+mZU7taSpuR4XHjwDvZJL58xTHlvD9bI/mABXPqeYdc0gxvmk2ej2VAvXEkHNG
         qhkiGAx4Ei8xm0HanvbIWotmLcY1jLjygNpQFwBqf7rorXryRszgLrdr32jnGwsWVhne
         TFbw==
X-Forwarded-Encrypted: i=1; AHgh+Rps4A2u7axpBzpY3lEHygttelXuxrUi1mJ4ubiDKMnaga/1KAis8vb1N/1cABgC1bhdFnCZClZVpuMY@vger.kernel.org
X-Gm-Message-State: AOJu0YyC5zd8TiR4E2TLnr4GwEzqq1iAGr8Dc6SK0QlygXeTOQyt+rQn
	e1e608FSg2D5iaJ5V0sVXOj7vJqXhWliw2iLzWBH8AvX/iEGDR4yvu8lXCgGOUW8+0M7iXoz7gt
	iZ8ADfRT1s3DGxvF+IpZ3poPV0el2NWRUzwW052Lfhf3EqI8oZ8WhwI3JxF55rPDCDSA/At2LEE
	zNK6Tnucoii8X918ifHQPkQla+I5mYLEdXTD3VOeI=
X-Gm-Gg: AfdE7clFgxBZoO2fUhWgfJmmVGI4fxmvsXN5rumrDhXKg+JL9CiR6vAypdbR1neHUD7
	4lQgNyhIlIzXAzsViR5On4CBZjIhZ3rWUW6a3Gdo7kIe2X/ZrZRcpEZXZ1GCwwZrn6bp7YH52dR
	31JFkzXJ7TLN25hMLvpFB7DGySd97Q7D6wpvH0OGSqgUAUAWqq9tCrl08duKBDveLPPRRflaPT3
	X1qrDUhGf/WWORePz25sG8WD1CI+LTWEs3FggNfCdReIpfDOGvgS1Lo+leZxu2cYjly50RYAMdN
	msS2zPtwQBM=
X-Received: by 2002:a05:620a:2713:b0:92b:814c:fb2d with SMTP id af79cd13be357-92ebb589766mr161261585a.60.1783352538081;
        Mon, 06 Jul 2026 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2713:b0:92b:814c:fb2d with SMTP id
 af79cd13be357-92ebb589766mr161255685a.60.1783352537646; Mon, 06 Jul 2026
 08:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-1-c1be0b472926@oss.qualcomm.com> <20260701-pulmonary-passably-c9272ba25533@spud>
In-Reply-To: <20260701-pulmonary-passably-c9272ba25533@spud>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:42:06 +0200
X-Gm-Features: AVVi8CeUJ6pVzmV1-XSIDcim_YRtoWjsN5T2iK6exKESLTqle6PByMrsNMzBRkg
Message-ID: <CAFEp6-15kG6PhZ=C=7j1dwCGnaoYX4k3pm90Q+LGWDG8VaHuRA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED support
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: zfKUWsDI8DM-Q1veBdf-mP1MHT107V2w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1OSBTYWx0ZWRfXwCJYalHi5oGi
 wmVxcBaCCQmIJ4M/esYdLuUSvuTHCDaiiRQawhQ5Nw71mwjWnTzWrkIeIUqCEzBL5dBWzpKUmXP
 zF4k16oCcSoh5d4Zvq6AWEMEdJrf0Lk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1OSBTYWx0ZWRfXz7ZH2/NzSpq0
 cnx1O+nRwRdd9s/TA16U72JPiyrrJbHrmaHm0aSbUp+JgL+9o90uuhGFZwXcpxqoLfpaI92In26
 Z5PBMrwTT2Hnq6bSDOD+pcipkvngDvO+FUcpznyQ67diStDXcLJo9njDL53ax/4RxxOHkWpBYrk
 jKyka89cByP9irrHi5phILMMuy8n96zOuC5+mY0R6NWH2lUqA0qOXe9s2+uqLPwgx9ZcqdcSeJX
 DWBbAtawyX/1y7GCnzT/sFb3SrqIcrmkggl39AjPECooKHq6vlgHcQfj0+tJxwArxMa+p48UK+T
 ATvvUOV9cc76Un3YZb+sJwkoNJg/z6HYjtRjzW1gocOL3MG5T0Zrf0i/3Cy4OZ/o/6vbHEB9mZW
 0qhAIkGnvLczKwQBxf0QPp54x+fgEiW/Od4sKhsNtDs9J0xmf80hRWT17tWsy7CuAJkQtQDFVi3
 hJvwxyBp9vtCpqMoSLQ==
X-Proofpoint-GUID: zfKUWsDI8DM-Q1veBdf-mP1MHT107V2w
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bccdb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nomciOSXjZiP-vvF2YUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8935-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 108387130B8

Hi Conor,

On Wed, Jul 1, 2026 at 6:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Jul 01, 2026 at 06:15:51PM +0200, Loic Poulain wrote:
> > Add support for grouping individual PCA963x channels into a multicolor
> > LED by introducing a multi-led@N node pattern. This follows the
> > convention established by other multicolor LED drivers such as
> > kinetic,ktd202x.
> >
> > This is necessary to support and model hardware setups where multiple
> > PWM channels drive a single physical RGB LED.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/leds/nxp,pca963x.yaml      | 79 ++++++++++++++=
++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/=
Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..04b05b8195c18ae9fc1c1cb=
9d3c694d819ea88e5 100644
> > --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > @@ -74,6 +74,39 @@ patternProperties:
> >      required:
> >        - reg
> >
> > +  "^multi-led@[0-9a-f]+$":
> > +    type: object
> > +    $ref: leds-class-multicolor.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
>
> Some valid looking stuff from Sashiko here.
Yes, I'll address them in the upcoming v3.

> On this, was this meant to be minItems?

We really want to bound the register values.

Regards,
Loic

>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> > +
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^led@[0-9a-f]+$":
> > +        type: object
> > +        $ref: common.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            minimum: 0
> > +
> > +        required:
> > +          - reg
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -137,4 +170,50 @@ examples:
> >          };
> >      };
> >
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        led-controller@62 {
> > +            compatible =3D "nxp,pca9633";
> > +            reg =3D <0x62>;
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            /* Three channels controlling one RGB LED */
> > +            multi-led@0 {
> > +                    reg =3D <0>;
> > +                    color =3D <LED_COLOR_ID_RGB>;
> > +                    function =3D LED_FUNCTION_STATUS;
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    led@0 {
> > +                            reg =3D <0>;
> > +                            color =3D <LED_COLOR_ID_RED>;
> > +                    };
> > +
> > +                    led@1 {
> > +                            reg =3D <1>;
> > +                            color =3D <LED_COLOR_ID_GREEN>;
> > +                    };
> > +
> > +                    led@2 {
> > +                            reg =3D <2>;
> > +                            color =3D <LED_COLOR_ID_BLUE>;
> > +                    };
> > +            };
> > +
> > +            /* Remaining channel used as a plain white LED */
> > +            led@3 {
> > +                    reg =3D <3>;
> > +                    color =3D <LED_COLOR_ID_WHITE>;
> > +                    function =3D LED_FUNCTION_STATUS;
> > +            };
> > +        };
> > +    };
> > +
> >  ...
> >
> > --
> > 2.34.1
> >

