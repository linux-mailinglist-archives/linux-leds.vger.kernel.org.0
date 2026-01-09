Return-Path: <linux-leds+bounces-6601-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62779D0A762
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 14:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35125301BCE5
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 13:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A0435C1A3;
	Fri,  9 Jan 2026 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0JTTK0S"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB812E8B94;
	Fri,  9 Jan 2026 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767965622; cv=none; b=tVd1iIDUWXB4OundeDz5VPCMULwLdx+u9dWWehP+esvXa/de38H1kw0LrK2ZVT54T9ofzI7TdqGZYc4IrEQoRQWrR41VSVPaNsCX8D83gYSVBKWbTQu6nxYmWjug643wILdYz00sG7bE0R2gW5CQhJ9BuAwU5xEnJmmhEl75YKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767965622; c=relaxed/simple;
	bh=LQUyd3vGywKl1tt4v7FTaee6X195SbdF/LwGioPgO0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jcz67LQKlx35V9IhyKkkN42bgFIhCkbYFO2UXpLFVMAmXSGPDSTCXn6i8icFb02t/CW3W5W2W9t9USESiEK247V3eQqJMCTu3hfQvJHfc2YZzylHBAUndeinXN2BscrMfCZ3phshtW6Zv6KODhVJKyMNpRRU3CBkicbbwflJJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0JTTK0S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E4DC4CEF1;
	Fri,  9 Jan 2026 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767965622;
	bh=LQUyd3vGywKl1tt4v7FTaee6X195SbdF/LwGioPgO0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0JTTK0SuScg/iiVRITNJPgQhFo6wCicXuq1pTQJFV7I1QNAIOscrK/4nmMlMUjhv
	 egOcy2OCsl9Y/M2qRjS4xH6T8+59mTV7cgy5gUporGVkhrmi5kVywyaz/vF+ez3oSx
	 VmJRDxYVTEXJ5q9cnOQARgiEyc/kp0KWOfynaVrIKS94NZN4scnMO0uBRYQYhH0j0E
	 QkO9qXdiSigxFXQVW79rdOsIWC/20vwe/uVE0FTofU99jIldVz7VMlwcJOmmPL8QjN
	 EYfeE1cnHnuREL8qBFSW1zH0bqB0tJPQQ7HrkGiyQlXoR9eWeTgzBMrgENx917rHOZ
	 1F0akGT210qAQ==
Date: Fri, 9 Jan 2026 13:33:35 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: barnabas.czeman@mainlining.org, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
	linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
Message-ID: <aWEDr3O9T7bASnj9@aspen.lan>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
 <aV-UyhP7wllSBpYj@aspen.lan>
 <67acbe8ff2496e18a99165d794a7bae8@mainlining.org>
 <0fe51f7f-9b77-4bff-ab1c-21c44a863a7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fe51f7f-9b77-4bff-ab1c-21c44a863a7a@oss.qualcomm.com>

On Fri, Jan 09, 2026 at 12:09:11PM +0100, Konrad Dybcio wrote:
> On 1/9/26 7:36 AM, barnabas.czeman@mainlining.org wrote:
> > On 2026-01-08 12:28, Daniel Thompson wrote:
> >> On Thu, Jan 08, 2026 at 04:43:20AM +0100, Barnabás Czémán wrote:
> >>> WLED4 found in PMI8994 supports different ovp values.
> >>>
> >>> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
> >>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> >>> ---
> >>>  drivers/video/backlight/qcom-wled.c | 41 +++++++++++++++++++++++++++++++++++--
> >>>  1 file changed, 39 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> >>> index a63bb42c8f8b..5decbd39b789 100644
> >>> --- a/drivers/video/backlight/qcom-wled.c
> >>> +++ b/drivers/video/backlight/qcom-wled.c
> >>> @@ -1244,6 +1244,15 @@ static const struct wled_var_cfg wled4_ovp_cfg = {
> >>>      .size = ARRAY_SIZE(wled4_ovp_values),
> >>>  };
> >>>
> >>> +static const u32 pmi8994_wled_ovp_values[] = {
> >>> +    31000, 29500, 19400, 17800,
> >>> +};
> >>> +
> >>> +static const struct wled_var_cfg pmi8994_wled_ovp_cfg = {
> >>> +    .values = pmi8994_wled_ovp_values,
> >>> +    .size = ARRAY_SIZE(pmi8994_wled_ovp_values),
> >>> +};
> >>> +
> >>
> >> Do these *have* to be named after one of the two PMICs that implement
> >> this OVP range.
> >>
> >> Would something like wled4_alternative_ovp_values[] (and the same
> >> throughout the patch) be more descriptive?
> > I don't know. I don't like the PMIC naming either but at least it
> > descriptive about wich PMIC is needing these values.

It's the descriptive but wrong element I dislike (pmi8994_wled_ovp_cfg
is used by pmi8550).

I know these things crop up for "historical reasons" when is appears in
the same patchset I have to question the naming.


> > I think PMIC naming would be fine if compatibles what representing the
> > same configurations would be deprecated and used as a fallback compatbile
> > style.
> > I mean we could kept the first added compatible for a configuration.
> > Maybe they should be named diferently i don't know if WLEDs have subversion.
>
> Every PMIC peripheral is versioned.
>
> WLED has separate versioning for the digital and analog parts:
>
> PMIC		ANA	DIG
> ---------------------------
> PMI8937		2.0	1.0 (also needs the quirk)
> PMI8950		2.0	1.0
> PMI8994		2.0	1.0
> PMI8996		2.1	1.0
> PMI8998		3.1	3.0
> PM660L		4.1	4.0
>
> I don't know for sure if "PMIC4 with WLED ANA/DIG 3.x" a good
> discriminant though..

Peronally I'd prefer that to making them all use pmi8994 structures.
It's a much better link back to the docs (at least for those with the
power to read them ;-) ).


Daniel.

