Return-Path: <linux-leds+bounces-3445-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C479DFD0E
	for <lists+linux-leds@lfdr.de>; Mon,  2 Dec 2024 10:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0391626EF
	for <lists+linux-leds@lfdr.de>; Mon,  2 Dec 2024 09:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03F71FA252;
	Mon,  2 Dec 2024 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBjhM2Md"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72581F9F63;
	Mon,  2 Dec 2024 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131598; cv=none; b=uchX9OSEJX7/v6ZJQ269mhb9nO1aNqwHye1VHUdiPoxUUZA7WESADarQBymHfvfaswB/kjq3RpD1pA5a0BD8NYGIw2NEyPja1Ti/SWufJQzoAOzJ3kJT7PdU1dCtHjGsLWx4DAdT+48H6uJTEGymsQy4QGPetUGxk93CGN8zeWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131598; c=relaxed/simple;
	bh=ynWAH9fQ4ujIPxs58oONnUtsiHSL3KKoCOBqGBaLlmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbeljaR2nS7iBTu1rirE8d63lHwbICiBi0MRQKrDgiuLpObItprN2H8XOtpVS3pvVrw2k0C+KGbR8RVrbAYC9iVgi+eU6qWEGOutqPPvZtgKblxOEDleOTbo3gtY/bb/gDFrUkHA1sOZIaDmDrrScBSMXelnzWzj2a7J6JzFekE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBjhM2Md; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666A5C4CED2;
	Mon,  2 Dec 2024 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733131598;
	bh=ynWAH9fQ4ujIPxs58oONnUtsiHSL3KKoCOBqGBaLlmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBjhM2MdbVZyIioL4v0TnKdvpjx6fRHDcc8GbREEvpFRgvhh6pocUZWZZo8FhaB+a
	 9X1qaZTqr6qvSZcrwkVz1Fg3B3kjYUPD+zndg2g3UK6YoyOc0FEAjUmG7rE/ZJ5g+g
	 G1Jy72rSi9DZXdIUWlyxJ//8m0tHVW1ci7wNtokmlIhNn1FOXweNH8XMkxVNP/D6BO
	 R9X0ii5mWGQu0NVK7GHMgiyaMVgwjo25QY5BYMlc2Mv/+Ye0PzdvmoPLLEGqZdv54T
	 5gXszoKSKC9ELiaxf1U8kscOKyyMF4pi/PCH6Xs+Ut8sF9D/ey6+A+ZnYY64z95rrh
	 KVfMtGWl3QHTQ==
Date: Mon, 2 Dec 2024 09:26:33 +0000
From: Lee Jones <lee@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Joshua Grisham <josh@joshuagrisham.com>, Kurt Borja <kuurtb@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org
Subject: Re: Adding a new platform driver samsung-galaxybook
Message-ID: <20241202092633.GA7451@google.com>
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <fd4a30e0-b5bb-47d7-8173-312417dce215@gmx.de>
 <CAMF+KeZkqwnBNT4vVNLEC03zZqSTSAE-Z=8j9ZLACf3yBeun8A@mail.gmail.com>
 <qsdbzbvpwlrnx2sqhrjfg3rukbm3z5gjkyjwlwoc3jnd3vre36@72py3mfwwsse>
 <CAMF+KeYGCZuc5DSCf4S+oZZgp5E4hwowJ+HqOy=ijjPZwv+zpQ@mail.gmail.com>
 <e46b4d6d-16f0-47d9-a680-c1ac90c52a97@gmx.de>
 <CAMF+KeaSarRT3weYhiCFO=Th5ZWMf=nvi53A+ggKYq2wBYAJpw@mail.gmail.com>
 <b531a5a7-d96a-4840-9831-d01a2b77c000@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b531a5a7-d96a-4840-9831-d01a2b77c000@gmx.de>

> > For specifically kbd_backlight and hwmon devices, I think it is more
> > likely that people will be making various scripts / config / etc that
> > do things like show the fan speeds in various widgets and/or control
> > the keyboard backlight via script, so it seems to me like it is even
> > better if these can be fixed names that anyone who uses these devices
> > will be able to use (e.g. "samsung-galaxybook::kbd_backlight" feels
> > better than something non-fixed based on ACPI device ID like
> > "SAM0429_00::kbd_backlight").
> > 
> > This feels a bit like sub-optimizing here, especially since pretty
> > much all of the other drivers I can see are hard-coding these kind of
> > names already as well.. is it ok to just leave hwmon and LED class
> > device names as hard-coded with prefix "samsung-galaxybook" and
> > if/when it comes along that someone has a problem with multiple
> > instances, it will fail with an error message in the kernel log and
> > they can submit a bug? (where we figure out what the right course of
> > action is exactly for that case)
> 
> I am CCing the LED maintainers so they can give us some advise on how to handle
> this the best way.

I'm only in receipt of a snippet of the conversation here and lack all
context, however I can speak generally.

It is unlikely that you find yourself in uncharted territory with
respect to device enumeration and future-proofing.  The kernel is
designed in such a way as to support subsequent versions of devices,
usually by versioning or literal enumeration (see PLATFORM_DEVID_AUTO as
an example of this).  Allowing future devices to break and subsequently
relying on users to submit bug reports sounds suboptimal.  If we can
prevent breakage rather than react to it, possibly after developers have
moved on to something else, then we should do that. Matching on known
ACPI implementations and providing support for that sounds sane.

-- 
Lee Jones [李琼斯]

