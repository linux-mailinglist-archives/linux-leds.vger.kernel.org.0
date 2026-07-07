Return-Path: <linux-leds+bounces-8949-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QJ0SMTbDTGpVpQEAu9opvQ
	(envelope-from <linux-leds+bounces-8949-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Jul 2026 11:13:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDA0719955
	for <lists+linux-leds@lfdr.de>; Tue, 07 Jul 2026 11:13:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MJ6o+9l5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bPRnRY1k;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8949-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8949-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 624B13153D95
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jul 2026 09:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255863955C7;
	Tue,  7 Jul 2026 09:03:59 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824BB3955F5
	for <linux-leds@vger.kernel.org>; Tue,  7 Jul 2026 09:03:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415039; cv=pass; b=P9FDLeKkYuFUcgftZPk17CX3AtSNiSE4R3TYfOVPMxmsDvhoFxvSlHJprHeenEkgE1e64YIMTMmYKczElBT0uFSwkJlMgXAUvrF8qRZrgETwa+t4Qks2zDk9VMIYw8+Ob+Px3GcQUQSe3lo2yIpjhUCfkWTp13OcGN7GPkgG77Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415039; c=relaxed/simple;
	bh=9FyuG7sjeOAPrtrynAcI68EoLlubdtH6jczOrlWt8tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdXFhLVIw5Q/W/tq5qi9FyaQtkHVgBMOZBuzaDnS81L2aMsqSSkjHhxniQM9KLKGSfeic1iaKC+uYeBkasKBfu2bSfSQqF4riAgbsIQCkr7hsnx53tPAgX2Hc48cX5QYbiyQqTJfAMaU6zwgY49er7M48NVZ+MSO/FxEktRbTPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJ6o+9l5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPRnRY1k; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E72O3004730
	for <linux-leds@vger.kernel.org>; Tue, 7 Jul 2026 09:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqtFzbu6ZptvNsw4DrQ0i4D9nyNMJgIO7R81K7kWg0s=; b=MJ6o+9l5JSCHixRe
	miMfPg+aVqKNc9GlbjcD4xXHv3ZRgkgTLfdsA4vEByifaRYUT2k3QgEGMZAzSiyA
	tZUX681/15/nndq+6wRcX+Eke8NHI+k3Oucz0muf4twtRBzWK8sjBDWf/qEGa/By
	5cao6zRXtccuh0kseYLkcp560jGYoEizvxlDfzMaPxZEHuRUDutpQKKEhCqQrMaO
	eMyFmZRIcFEFEpSf4DGOo8FBgYQmz38eB97VeaC9bpy9CdZwz4JfpLqhdE3oycqv
	5pe1jy/+SxmfPyjwgN1MzpEd0yaMiRhI7s46mS6FHga5vOIP+eTtoY2LboFVBKD6
	Dm8puw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su714db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 07 Jul 2026 09:03:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so48591536d6.2
        for <linux-leds@vger.kernel.org>; Tue, 07 Jul 2026 02:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783415036; cv=none;
        d=google.com; s=arc-20260327;
        b=PdcPUPSNBYIZgp4il3vfeCLG7X0Rwgkl0qScE4aJlLnMRHvxeC8m60fSx1XKsaKo0e
         6LtjGbU94DGg0uUxpUE+F4NrzxLfFvPbva7LAGHJy9x4X4UUSFfKpWxINrj8TpM5rS3a
         ucRagW+YY4GW4l3Q43P9tDZwpEuz0jMcn3SvTJO/AdhVh3Mvj4hMNQvaSkZc4eYDYyMj
         Wy+qhGKpNxN/wUANDSYNygtRv+7NYS7o1YCen8RnPKGYwShTSbjlVNOU1Y1WC8WQYpxG
         QT4EjFrGbeKyX7xNwq3Oiojyr1oEl4m68UQ7O7ATtPjEWhljIzqNhAPIuMV1LJ1fOKjG
         YEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IqtFzbu6ZptvNsw4DrQ0i4D9nyNMJgIO7R81K7kWg0s=;
        fh=J85NQ24uO5cAmbvfiIUWUSSHxjA1mXCmFD67JcFTuyw=;
        b=HOAeqNfZJAF+Jsgm6u81OWgxC1rN5U2UFlKubtGgTFr93Ac8jmnGSNVntkA/yer/Te
         SPfRnWmoFjoNGFsIwz2GxpX160Hz4xYYEBe5oOm9WzarR76lyDruoBGYy5k6nGPZyh4j
         21Bcvs36PbN84n9vb6qNI/CWAARmNibIxaEQ7z8TCLs45HzP6vqqF08pJdcQiSp3S0/O
         zGtqO5mPO6m/F5zg/XtMnNQ6dHfKaN0HwP8PQ8dqk0k+oDk3brhVcgzWNBn3inszYUVV
         ieIMyFrMAaSy7lNP167NrTadX1ImkLrV0FKr1xc9KnPtT1mZqJT58fh9k7esF4tEvagJ
         p5Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415036; x=1784019836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqtFzbu6ZptvNsw4DrQ0i4D9nyNMJgIO7R81K7kWg0s=;
        b=bPRnRY1k/LVDA9DnleZLdmJwU4DSXd5zSE20NJ6tnlE+t+FAMSzi9LwatkzSbspweA
         pGHkrolE4bMakVxmQfQregWtQ1nC9CLs5EOfhHu755GXQco/cipQ3ydaPNrMZzb4WPXv
         qeoQaFKbAzRi0kcN+msQ+pujhZtOEX2AwrOhfQR+jG0+ShmzLGtPHc3M0RA4bbwJelv0
         ag+u948kBM7wUa1ovjdoKftfQ8qQh5KpJ3s4UBnKztKbpkvyOTHqjjAb+vs5sfyUGsEE
         MB5HOe9KSxjqbBEqKr3Dg4D6OPZRhUzdWWkuBoxIkUbLlxtF3k6yRsjoGtSESZtOAHbU
         NzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415036; x=1784019836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IqtFzbu6ZptvNsw4DrQ0i4D9nyNMJgIO7R81K7kWg0s=;
        b=cb28iax406qTgL6C6hDhh+D0uSGfW6Zjo4Al+habl8X8WV1ttybC1xJEZJcYKbYsWZ
         vRs0zLNnDxR4JjOCxIE109D54fs2b02w3vdeR9QDM9tsPr9W0zJo/K4j2On7/fbyPfvv
         LwRWaLMx22ZEksCaL3cFkF8ygduqxCquSID6tUj7p3h3297uQSrvIjJiVjUSAu+WIpSH
         AsFmbX0Tql17XfNkJiX/RgUG3W/pxFygFZUEhOjEd3m3u9W9Yc4RqulfwUTFO57ZeAm2
         E+S2d5PCDSxWdG9Cc7B5btXvAWuj1bSvCfa6cc6YrPiPppKU24dTtCExU23bfy1nO/sN
         wneQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqA2+ymqv6+DDsgfwHqM7pEVNwl1NRV8ApjQyX99cLdgPRVOLInvNXOLGVLC9ar8bBuDSeXyp+BbOL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi7s9AlXI6pK6CiVovtroDzbB5055qIveDhOMkWaGEyG33QWpy
	+E2xxips5gugqy+yetUDwxjT9fcd8IRvVe2ON4Cc5vy0k0EekIVDZ28ZnYxzGVxjHfJ8km/Ci1G
	SPNT9dWp+FqqeQm3ZVzu6nD6E48YlGoHyiGy0groMOx2aQPM+MDbjPVfDsfHLnR48GW3MftmuEz
	0KoLlgZIkGdzkK+VuQzA6m86bLJAa3pwqjzPxQc3A=
X-Gm-Gg: AfdE7cmwX1I854bc+LsfX9jBOx6qG80xdGymLIxLtbakU+CFNk9w8LBtcexu9Yyf+IT
	riFjr0uzgMe0HnqCkn0OXro/uKcc4mwq8Qf/zI4fc1uB2UhWsotZi7PIaTaaNN3zPdoTioxvDZ9
	fBxU/nnZKl9ThqGmRuQZwrw1Tu8wVPsB/lFTbV+7o8egMXGwkb54e23X/XznmfQw+KcRLczLnkC
	n538ztsjlm16KUtqpEK8jup74MQhdB1+CIkpTyzqBfFIRUmp3zBGnTszXgGcDow6zBqUPK/3bjU
	YVRCmgz93UE=
X-Received: by 2002:a05:6214:3d9e:b0:8ef:9dfb:1f56 with SMTP id 6a1803df08f44-8fcb51e6c22mr45473676d6.52.1783415035624;
        Tue, 07 Jul 2026 02:03:55 -0700 (PDT)
X-Received: by 2002:a05:6214:3d9e:b0:8ef:9dfb:1f56 with SMTP id
 6a1803df08f44-8fcb51e6c22mr45473286d6.52.1783415035058; Tue, 07 Jul 2026
 02:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
 <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com> <20260706-account-harsh-093c6354bca5@spud>
In-Reply-To: <20260706-account-harsh-093c6354bca5@spud>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:03:44 +0200
X-Gm-Features: AVVi8CfJSRaPJwhTLYj1cS0kmlijGTDjxXc5W_8Ag6eQlnRy7D4lfAYGFXRDmio
Message-ID: <CAFEp6-2k1O80iY9f8WeoHHRZPMdKGcOTYuEsDvpZmZZXTz3xbw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED support
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NyBTYWx0ZWRfXzJYCX49kKdsK
 woqVR+Ib8wezZEAAEk6Ni6h8yHVLzb5Ezoo6ESDVdBINyGk3521NYDn2OiiWi+u0xJhSYutNglk
 O0n0E/BleZmckLjS84ipIGwOGMzvQnpzF1SfBRnp1ufRpENcPRFBtDEsOtzK0KJ2gdD3ZqoH7rA
 Gepio+1LJ7iWSe7lEGnTM1R9F+I4ZnUcXJreQV7yWKgEZBcRv8NwUfPExaiw+oqPSKEO7U3F20g
 ARZDidRPTreDLgsaLq9YmmdHKHt2gsyYNdLjJEtkLTFG9jYvMZeXvpO9lID09R6TUJte9cngxCG
 JMQ5YUZdf0A/9ipVJ6DAq9+N8Fb18TaGS2yyoiEvzZAIYoc9Oj79mKXby/B5CsqvQUlnMaELfCr
 mvkCYRodG+r6+gH3v4x9EfnuhuzrSVrss/2wSF5KKrLBWb/KHsqL12Jyt8LfuAOaKBres5T2/u5
 mle2jJCGtUEuFChUH2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NyBTYWx0ZWRfX89a6p0jyJh37
 SiCz+6nGyGiIJBWA6kwJLBoYUJYtC1/8iA2TREbCP07ueBqZUeSq4XR2BmGYPYFJWXknqz96C+a
 m1MYXLO16iC4e66hWd+BEQ73iPg4DQc=
X-Proofpoint-GUID: RZZzU4nzsGf_MmRapEqlZJibUrzGicZx
X-Proofpoint-ORIG-GUID: RZZzU4nzsGf_MmRapEqlZJibUrzGicZx
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cc0fc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=WjbTyRfs7wdu-KiIkK4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8949-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DDA0719955

Hi Conor,


On Mon, Jul 6, 2026 at 6:56=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Mon, Jul 06, 2026 at 05:49:56PM +0200, Loic Poulain wrote:
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
> >  .../devicetree/bindings/leds/nxp,pca963x.yaml      | 104 +++++++++++++=
+++++++-
> >  1 file changed, 101 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/=
Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > index 4034139e3f770a1035208490a9436bdc33387279..dccdb1d9421199a51cac5c7=
f3f7da503caa35622 100644
> > --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > @@ -74,6 +74,40 @@ patternProperties:
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
> I still don't understand this, minimum zero is literally useless since
> this cannot be negative.

Good point, yes. I just reused the exact same pattern already used for
the existing led@ property (minimum: 0, with the maximum only set in
the conditional sections).

> If anything, you should be constraining the maximum value. Remember,
> outside of conditional sections the maximum permitted values should be
> defined. Conditional sections should just narrow the constraints.

Ok I will just set `maximum:15` here and address additional
constraints in the conditional section.

>
> Same below.
> pw-bot: changes-requested
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
> > +          - color
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -84,10 +118,16 @@ allOf:
> >                - nxp,pca9633
> >      then:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]+$":
> >            properties:
> >              reg:
> >                maximum: 3
> > +        "^multi-led@[0-9a-f]+$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]+$":
> > +              properties:
> > +                reg:
> > +                  maximum: 3
> >    - if:
> >        properties:
> >          compatible:
> > @@ -96,16 +136,28 @@ allOf:
> >                - nxp,pca9634
> >      then:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]+$":
> >            properties:
> >              reg:
> >                maximum: 7
> > +        "^multi-led@[0-9a-f]+$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]+$":
> > +              properties:
> > +                reg:
> > +                  maximum: 7
> >      else:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]+$":
> >            properties:
> >              reg:
> >                maximum: 15
> > +        "^multi-led@[0-9a-f]+$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]+$":
> > +              properties:
> > +                reg:
> > +                  maximum: 15
>
> Is this 15 the maximum for all devices?

15 is the hardware max for pca9635, and serves as the default for any
future/unlisted compatible via the else branch. Per your comment
above, I'll move it into the non-conditional block so it's enforced
unconditionally instead of only through else.

> If so, why does your regex permit values greater than 15?

The unit-address regex only validates that the name is well-formed
hex, and not the numeric bound. DT convention requires the unit
address to equal the node's reg value in hex, so in practice this is
limited to 15.
This is again a copy of what the yaml already describes for other
device's constraints. However, I can tighten the regex itself instead
if you'd prefer that approach, but that would make the yaml a bit
inconsistent.

Regards,
Loic





>
> Cheers,
> Conor.
>
> >
> >  additionalProperties: false
> >
> > @@ -149,4 +201,50 @@ examples:
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

