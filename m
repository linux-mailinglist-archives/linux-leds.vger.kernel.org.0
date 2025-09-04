Return-Path: <linux-leds+bounces-5392-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6193DB43E3A
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 16:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593861C86F7E
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 14:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A14A306487;
	Thu,  4 Sep 2025 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0axW7Ra"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ABC163;
	Thu,  4 Sep 2025 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756995006; cv=none; b=i/7uN+3RRLgO+s2O7p7ekS/1+v9pad9S0jOCGybFPepx27KA6fcYaAevbnz1KwnM2Gj3hRtlfg4Ik0VESlfV3POrwyqAy+m/kEUd7fk7Bhu88g/5HLYzIy5hxVQvR/LAPWK8jrbcCwzUNVaoqX2ikbrFsNkc+PLHoXpEVPtaY3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756995006; c=relaxed/simple;
	bh=y5C7ftCVR4/51LmeG5cadOCVIcNVF+XzazajP0Lvo8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuowEyb9KgjI0R09jHBkBELDKJXufXwAC8QkRJdAo6ZxGvuzGk+SgtbFV1tngXnv8ovbhsHznSxw5fncANGJ+S8q6bGNKmBKwiSlKTmMpCrDLkxncffrqkvPq8w1Pp7D1YytXGyPc2GItuDHUYSE6r3//ejhIoIk/BrxZF7Kimg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0axW7Ra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FACC4CEF0;
	Thu,  4 Sep 2025 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756995005;
	bh=y5C7ftCVR4/51LmeG5cadOCVIcNVF+XzazajP0Lvo8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0axW7Ra/XVeMYFmhVwMANaZrfNZuoJYNCGi+LrDplDp7eH67UI4cIoGRnfDvAQpd
	 Y5woBgK1HvmBmIe9wlf7iqAm4cRtn7c1g+Jn0bAUWGHG3gcP2hQqc/zTUD57vn7WTW
	 xHsx3wz3ujJsz/HGpub/bHgWYkrCyv2BGuUTMBWyj7pAz1L5Na/zlWB8uCLv9hqkH2
	 g7Os/k+jR6W++orCmN9TYIh3Ag62sWeKxL2Jt3ztO2qRSFZlRaPcrLoVLYJKUJILt+
	 yIHhPuMe/3Cbfrk9C6Wzwe1hvAe0+AUq9E3CF9pSAmEQH/2htKYfDPH/YX3dYofzd4
	 0zgHLmGMiD5Sg==
Date: Thu, 4 Sep 2025 09:10:04 -0500
From: Rob Herring <robh@kernel.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	bryan.odonoghue@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org, lee@kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	pavel@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <20250904141004.GA3875305-robh@kernel.org>
References: <20250902182114.GA965402-robh@kernel.org>
 <20250903235615.134520-1-alex@vinarskis.com>
 <20250904-brave-zippy-quoll-fcb054@kuoka>
 <daf442a6-b4d6-4213-8ec0-10397d682cc4@kernel.org>
 <fdc68c54-a499-4ba6-8788-70c7ea515f2d@kernel.org>
 <691f72aa-6d3e-47a1-9efe-a5f7a61ecb72@kernel.org>
 <9c536e24-ab5a-454a-93af-6d4c51d4e1ce@kernel.org>
 <ece22424-ea6f-4d6e-8964-3418853dba2f@kernel.org>
 <e89de497-9c6e-4a4c-8f66-019d349c171b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e89de497-9c6e-4a4c-8f66-019d349c171b@kernel.org>

On Thu, Sep 04, 2025 at 02:05:08PM +0200, Hans de Goede wrote:
> Hi Krzysztof,
> 
> On 4-Sep-25 1:47 PM, Hans de Goede wrote:
> > Hi Krzysztof,
> > 
> > On 4-Sep-25 12:47 PM, Krzysztof Kozlowski wrote:
> >> On 04/09/2025 12:29, Hans de Goede wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On 4-Sep-25 11:45 AM, Krzysztof Kozlowski wrote:
> >>>> On 04/09/2025 09:26, Hans de Goede wrote:
> >>>>>>>>> +maintainers:
> >>>>>>>>> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> >>>>>>>>> +
> >>>>>>>>> +description:
> >>>>>>>>> +  Some LED defined in DT are required by other DT consumers, for example
> >>>>>>>>> +  v4l2 subnode may require privacy or flash LED.
> >>>>>>>>> +
> >>>>>>>>> +  Document LED properties that its consumers may define.
> >>>>>>>>
> >>>>>>>> We already have the trigger-source binding for "attaching" LEDs to 
> >>>>>>>> devices. Why does that not work here?
> >>>>>>>
> >>>>>>> I have not actually considered this, as the existing privacy-led solution
> >>>>>>> from the original series is not trigger based. At least one of the reasons
> >>>>>>> for that is that trigger source can be rather easily altered from user
> >>>>>>> space, which would've been bad for this use case. If v4l2 acquires control
> >>>>>>> over the LED it actually removes triggers and disables sysfs on that LED.
> >>>>>>
> >>>>>> So does that mean that v4l2 solves the problem of "trigger source can be
> >>>>>> rather easily altered from user space"?
> >>>>>
> >>>>> Yes, currently the v4l2-core already does:
> >>>>
> >>>> Thanks, I understand that it solves the problem described in the patch,
> >>>> so the patch can be dropped.
> >>>
> >>> I'm a bit confused now, do you mean that this dt-bindings patch can
> >>> be dropped ?
> >>
> >> Yes.
> >>
> >> Alex's explanation to Rob felt confusing, so I asked for clarification.
> >> You clarfiied that that v4l2 solves the problem, therefore there is no
> >> problem to be solved.
> >>
> >> If there is no problem to be solved, this patch is not needed.
> >>
> >> If this patch is needed, just describe the problem accurately.
> >>
> >>>
> >>> The existing v4l2-core code solves getting the privacy-LED on ACPI/x86_64,
> >>> on DT there is no official bindings-docs for directly getting a LED with
> >>
> >> There are and Rob pointed to them. If Rob's answer is not enough, make
> >> it explicit.
> >>
> >> Really, there are here some long explanations which do not really
> >> explain this in simple terms. Simple term is: "existing property foo
> >> does not work because <here goes the reason>".
> > 
> > The existing trigger-source binding for "attaching" LEDs to 
> > devices does not work because:
> > 
> > 1. It depends on the Linux specific LED trigger mechanism where as
> >    DT should describe hw in an OS agnostic manner
> > 

Using a binding does not require using the linux subsystem normally 
associated with it. Certainly the naming was inspired by the Linux 
subsystem, but it's really nothing more than a link.

> > 2. It puts the world upside down by giving possible event-sources 
> >    for the (again) Linux specific trigger rather then allowing
> >    specifying e.g. specific privacy and flash LEDs as part
> >    of a camera dts node. IOW it makes the LED DT note point to
> >    the camera, while the LED is a part of the camera-module.
> >    not the other way around. So it does not properly allow
> >    describing the composition of the camera.

Direction of the connection doesn't really matter. You can get the 
association either way. But certainly one way is easier than the other.

> > 
> >    Note that Rob actually put "" around attaching because this
> >    property really is not proper attaching / composition as
> >    we would normally do in dt.
> > 
> > IMHO 1. alone (this being Linux specific) warrants a new better
> > binding for this.
> 
> And:
> 
> 3. There already are bindings using a leds = phandle-array property in:
> Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml

This is most convincing for me. So please move this to a 
led-consumer.yaml schema first so we have exactly 1 definition of the 
property. And summarize the discussion here for why we need this.

Rob

