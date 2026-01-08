Return-Path: <linux-leds+bounces-6574-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0C7D02AFB
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 13:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D33F5302F801
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 12:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBA645029A;
	Thu,  8 Jan 2026 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bNmYW9mb";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="PBLmol3z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4355341E5D4;
	Thu,  8 Jan 2026 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864628; cv=none; b=sTqRL27ZD6f2teHe6S0wkfhSobDX8zNaV2sg1dhZRm634QTnjBEC3PNUTV0mZ/3f6uoXqupiu4qDt3l9FwVw9MnTKkzELeWhie6oPFinti4JiKHaqX54uEAP/aYvlyUqvvYsT/ZvfJobfY+P+FBWmGAhFaWrgvX59Rrq951S6+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864628; c=relaxed/simple;
	bh=R28py7aOUMSHDw9GTWXObj2zn8ywuQsBWDeYZtgNrFM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=gzGmENtFj+uj8UaACztJw+Sm1C6aiP5K2bhc1AmgwiXZym4Jpc2anc/eZf3tyUJ35eXp2fqevV36olbAC/aDHA5Px/zlz3XIvq9xegxQPsYs08xHzNB3MlrFua7VqXQcaBhaCVGpzvp13nsxMMCL9H0dI3zGgZTpvaInI0Nt9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bNmYW9mb; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=PBLmol3z; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767864616; bh=+K11+gyj9g6pr1Fpatee6Fb
	hZy6Ep79Tz865ZNh+y2o=; b=bNmYW9mb+hvjiXOEHgfKR388gGi1kaK5ew8+1VFhAz3409D1zl
	Jby0ccPef2RHURAi4zCoDtZ02eNHBuoSxWQhI37IsKXjJHEO6+JyrRXf15Yn2xWsbfV4+LVnpn6
	7SfQ/AOr8NL+j7Aec1JfwKI49sfaTdjKtfAJtidseDG8G5pJqu8F7ZT1twbMbTBsxxxG++PilFc
	qUQco/aw6xKwQN9zFHABPuX5YAKofsgqe1JfCY6R2KmnPkdPTvitRZUZxyYNcM95+aBp5rsm3Tq
	Pt0BLx0R9O1y+IL3qK2sHhK5SZ6wjkdXTBFIbPAMc4Py6DSvRZavArSllhar9NwlNqw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767864616; bh=+K11+gyj9g6pr1Fpatee6Fb
	hZy6Ep79Tz865ZNh+y2o=; b=PBLmol3zo+INqRrInBMw5dF73Z7o/6UOGtR1zM5ijDZ0zRlzzv
	3nMgGEK7kkBXP64oWTCvdMKxtMXFzIQLMzAQ==;
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 10:30:16 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Kiran Gunda
 <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, Luca Weiss
 <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy
 <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, Alejandro Tafalla
 <atafalla@dnyon.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
In-Reply-To: <52778327-69bb-4f6c-8d64-094f33809480@oss.qualcomm.com>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
 <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
 <c7bca43b1b912a6a100d83229d78abde@mainlining.org>
 <52778327-69bb-4f6c-8d64-094f33809480@oss.qualcomm.com>
Message-ID: <1d1601c3b871e67c76e4f3572400b2d7@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-08 10:22, Konrad Dybcio wrote:
> On 1/8/26 10:17 AM, barnabas.czeman@mainlining.org wrote:
>> On 2026-01-08 09:54, Konrad Dybcio wrote:
>>> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>>>> Document ovp values supported by wled found in PMI8994.
>>>> 
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> 
>>> I reviewed a version of this that said PMI8950, which is very much
>>> not the same..
>>> 
>>> Let me try and get some more docs to confirm or deny what you're
>>> saying..
>> I have sent it for the previous revision msm-4.4 contains the 
>> documentation.
>> https://lore.kernel.org/all/95f7c89fdf9b856f567a498cc56ecfa5@mainlining.org/T/#u
> 
> Right, but I didn't send any reply acknowledging that.
> 
> On v1, my review tag meant "I concur this is the case for PMI8950"
Yes, sorry. Since they are pretty much same i have considered it is a
minor change i have only changed everything to pmi8994 because it
was introduced before pmi8950 at upstream. I will be more careful next 
time.
> 
> Because you carried it in v2, it appears as if I said "I concur this
> is the case for PMI8994", which is not what I then said.
> 
> Konrad

