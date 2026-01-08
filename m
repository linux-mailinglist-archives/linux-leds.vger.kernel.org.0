Return-Path: <linux-leds+bounces-6582-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92578D04AAB
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 18:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D855236354C6
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 15:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F93C3A4ABA;
	Thu,  8 Jan 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThLzjdMe"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7893A1A5A;
	Thu,  8 Jan 2026 11:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871698; cv=none; b=Qhm5XRJxs8ttatgo6FdjaJZ92uFrAcNffDCShVXOf4YTVyF7pUg2e2Il77y+sKMgId30fY4i7TETVGAaPpNw++Rde9W9UnQf/RN0PCXLpR9lWZddoxnook0GgQwZhdgmrYDtMsj1VR6UGCdp1GFWMa0CIj/wT9QL7pOTcZKW11U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871698; c=relaxed/simple;
	bh=3Kjhp0b3kwImrDL2L6LwF5n2i36fqNua3dzRnbIjReU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhlqB5604pFFggRHglCdPuKhj4TUrK5Q6u+IngZiblKyKjq7mgLkae7cdWZ3lxsne/uODK54Oy8a6CKgM8P7we11e8rIo0X5U7Tp4Flyb0bkg9j/6oYGRy/TskdIm0N4Attv6rqzqCQ4i4nqBJNP57fbKowwhG1Rbh/Dk9kAr2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThLzjdMe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEAC0C16AAE;
	Thu,  8 Jan 2026 11:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767871697;
	bh=3Kjhp0b3kwImrDL2L6LwF5n2i36fqNua3dzRnbIjReU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThLzjdMelW930c+ei43cTLAinWpByX4H/unWusBtDJx67SVViBKH2HJp4NN6pfDNJ
	 S0o7hNKCFpHN/OgGfD6igSGlJ+DPmag7+/e0kTpckOhnpH4/JEH0gfkDq+GHZ7SxYn
	 sTyyqEFxobiUx11gdTDahJHp0S7VvuoNQkGG/Ur1aZa0Y+nB3xQm4Fkmv34B6GL8QO
	 Nq7K/rJN9iNmi7PHXBbpiP7k8HzQKFH8gMdUHColDMn4ALEVUyYXDEC8klO5AsygFp
	 YxojfWXoN1bQ6FS99fp0EAppdIAS45JOYnyHidAfSv8R/GxlvUu1OujF92bEY8vZHy
	 1hh01tlZp1NfA==
Date: Thu, 8 Jan 2026 11:28:10 +0000
From: Daniel Thompson <danielt@kernel.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
	Luca Weiss <luca@lucaweiss.eu>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Gianluca Boiano <morf3089@gmail.com>,
	Alejandro Tafalla <atafalla@dnyon.com>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
Message-ID: <aV-UyhP7wllSBpYj@aspen.lan>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>

On Thu, Jan 08, 2026 at 04:43:20AM +0100, Barnabás Czémán wrote:
> WLED4 found in PMI8994 supports different ovp values.
>
> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 41 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index a63bb42c8f8b..5decbd39b789 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1244,6 +1244,15 @@ static const struct wled_var_cfg wled4_ovp_cfg = {
>  	.size = ARRAY_SIZE(wled4_ovp_values),
>  };
>
> +static const u32 pmi8994_wled_ovp_values[] = {
> +	31000, 29500, 19400, 17800,
> +};
> +
> +static const struct wled_var_cfg pmi8994_wled_ovp_cfg = {
> +	.values = pmi8994_wled_ovp_values,
> +	.size = ARRAY_SIZE(pmi8994_wled_ovp_values),
> +};
> +

Do these *have* to be named after one of the two PMICs that implement
this OVP range.

Would something like wled4_alternative_ovp_values[] (and the same
throughout the patch) be more descriptive?


Daniel.

