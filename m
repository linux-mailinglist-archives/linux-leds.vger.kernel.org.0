Return-Path: <linux-leds+bounces-2152-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA07B9186F0
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 941602810A3
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815EE18FDDC;
	Wed, 26 Jun 2024 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhlNy5lc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DCF18FDD5;
	Wed, 26 Jun 2024 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418125; cv=none; b=XbTFPKIRYPjYVsD5anPKrUhp4mulJao9NUNXmPFyALzZ4TqblfsGU9QvEQcroE6OhiKr2+coEGAWgSu3EIxiimbk5hkSF3IRga9n4Bq2ied2Fg5ztqQ67osJAwijD2qWj1YldqSZ4c2avHyyAwsNrhmgGZ17lZ585iE+JMEXN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418125; c=relaxed/simple;
	bh=K8GPWaRo22t47jtcUUzGs4LSuBj4VURWjO3QytmzkM4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mTYpTHacWvV2O5X8po7+WDqVHVp1KnD0DcVDOr+TwygjUzzYR4vY7wVu9J/i4Hc77ea0oh+RFPqgwuhO32RxSYk5Ir05VUUSQWvNgzvsq6MzHPP6tbX+AIMQJN15ohNMZ3VO8oCSvULxRzma6TnS+uapKqWWocpv4izBFLoKeWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhlNy5lc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A306C4AF07;
	Wed, 26 Jun 2024 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719418125;
	bh=K8GPWaRo22t47jtcUUzGs4LSuBj4VURWjO3QytmzkM4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MhlNy5lcZdRfj0RT33ZpNR7keqYYzgf7n1xVnDk1vyT1gYbWJjCBrQXtJ0Og1Z25z
	 j82UpFRZ70z0+bSLic4+VPMe4doI4yAzmGOKxtcxVt2BCKS6rN2/318n1WRZtX8njX
	 LLPO9avgIGFTSW7X2N6a9n98k2tkqenl0+/Cv6up+b9fsGRPk71geVBmUTmNwbUs/X
	 hofarhV+bs5IQvI3uhtNxc+Tps0lBDlb8w3jh2ew7/pZXMrOra6eblaobeOn5emAEj
	 +y5nl/HlYqsO3hTM0dBHjsqftiFzIRNCZ1ZmzOLvFmX29UpsLfL4u60S/hCnYIQ8H+
	 z4x/YdWa2x4kA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20240626160027.19703-1-ansuelsmth@gmail.com>
References: <20240626160027.19703-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v8 00/20] leds: leds-lp55xx: overhaul driver
Message-Id: <171941812315.2542017.2142891856682487960.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 17:08:43 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 26 Jun 2024 18:00:05 +0200, Christian Marangi wrote:
> This long series is (as requested) a big overhaul of the lp55xx based
> LED driver.
> 
> As notice for these kind of LED chip there was the bad habit of copy
> the old driver and just modify it enough to make it work with the new
> model. Till v4 I was also doing the same by following the pattern and
> the code format of previous driver.
> 
> [...]

Applied, thanks!

[01/20] dt-bindings: leds-lp55xx: Limit pwr-sel property to ti,lp8501
        commit: 468434a059a7d1fad4b98c2ca080817b1520cbdc
[02/20] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
        commit: a6ca48430de6e87644203bdca03f4065f5b9df7a
[03/20] leds: leds-lp55xx: Generalize stop_all_engine OP
        commit: a9b202b9cf0e817be756a720920ad4b522e6f6aa
[04/20] leds: leds-lp55xx: Generalize probe/remove functions
        commit: db30c2891bfc74acb8823edee5f39cbc36bd9a4d
[05/20] leds: leds-lp55xx: Generalize load_engine function
        commit: 4d310b96f2db602830c40f82a75ede799b243cce
[06/20] leds: leds-lp55xx: Generalize load_engine_and_select_page function
        commit: 409a9dc53682b9f02793584d17721ab3e1b9c86f
[07/20] leds: leds-lp55xx: Generalize run_engine function
        commit: 42a9eaac9784e9b3df56f1947526d7d4d0ed9b26
[08/20] leds: leds-lp55xx: Generalize update_program_memory function
        commit: 31379a57cf2f155eb147ace86547b7143592945a
[09/20] leds: leds-lp55xx: Generalize firmware_loaded function
        commit: a3df1906fb9aa9ff45149e0a3c6434b2cef4f6e7
[10/20] leds: leds-lp55xx: Generalize led_brightness function
        commit: c63580b27a2c638cbae2fc26484b0bf29f303134
[11/20] leds: leds-lp55xx: Generalize multicolor_brightness function
        commit: 794826b2d87538a0fa5429957439f82bb7f32b53
[12/20] leds: leds-lp55xx: Generalize set_led_current function
        commit: 01e0290d17b2fb9717ee80fed512b32e0460b14c
[13/20] leds: leds-lp55xx: Generalize turn_off_channels function
        commit: e35bc5d8a023a55a5f895d6648a455ed83dc0db2
[14/20] leds: leds-lp55xx: Generalize stop_engine function
        commit: 43e91e5eb9c8b36ddd1dc239e0d8c36cc034e8ca
[15/20] leds: leds-lp55xx: Generalize sysfs engine_load and engine_mode
        commit: 082a4d3f068734eb242e38892d0977ef271c0143
[16/20] leds: leds-lp55xx: Generalize sysfs engine_leds
        commit: 8913c2c14728851f110e0d439d5bb2360c767cd2
[17/20] leds: leds-lp55xx: Generalize sysfs master_fader
        commit: 5a15b2ab57095a7c8597d42efbfe452844578785
[18/20] leds: leds-lp55xx: Support ENGINE program up to 128 bytes
        commit: b9d55087dfa950aecece1cf864d3918a12694c25
[19/20] leds: leds-lp55xx: Drop deprecated defines
        commit: 49d943a426d1e2c034ff2f132f65590dbdc01fbd
[20/20] leds: leds-lp5569: Add support for Texas Instruments LP5569
        commit: 30c6743cc89cdb357d1f8a98978da0f7c138130b

--
Lee Jones [李琼斯]


