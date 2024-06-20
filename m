Return-Path: <linux-leds+bounces-2064-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A5910D86
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 18:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFCEA1F21CA1
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 16:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903B31B151D;
	Thu, 20 Jun 2024 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHIen+D/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C9E17545;
	Thu, 20 Jun 2024 16:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902165; cv=none; b=lPP2xdnakophTLhhL8cCRLMP2cxsPVfJNQDdzAAEoMW8FyzW7lNv5GItLXcTl7syaDzwjRjiB1IO/1WRBNn4Qybcygt2QyauzDFRBzcdIwS9zTLB6eDifIprLA6lgewPa6ffG/LEomwx+VCAESXMNYLZqswz3K7KH5yGz14mquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902165; c=relaxed/simple;
	bh=vScpnwY5heS08FMXZ8yiOcSV2XXsxrVSVnrksoqfQaQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NloaH4/9fJD80DuJDLwKsEQdHYK9bZzQHGp7E3SxE2u6jdwo38EL4gBImDy6M+OucvdoGHhzScgflWwQgChHBT9w1iRUTBqLfKZACqz843K6ARYEEiu2F/0no4LJMb9rIbHkfVR1s/jO6+skJW3xTP4L27e4SQg+CMDz3GJPBog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHIen+D/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46BEC2BD10;
	Thu, 20 Jun 2024 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718902164;
	bh=vScpnwY5heS08FMXZ8yiOcSV2XXsxrVSVnrksoqfQaQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=sHIen+D/E0UwScqAZCykfpAv6LBmwgGXVLW2EP0XShI8hSsZUV0OEkTdryXfAIQaI
	 Fnw0Rvq7+r4Kixa6xo7EtdDsSXZ5uonTbip+vvbojh4pHcJA4LmcoZFE0wgiKML5pU
	 SQkdvGhLraZHDnosrLgTkIGCDh4jqKSZCxYMV9UODfhMhATLUEepTezeK7fEVnCAQB
	 xSE2kvBhqowE/EpxROC2gtCPRb4C/qj6mJnPHbgMGSQ6OHzU33S116xvc265slcaCI
	 63zofgaaNCA1/Kn4acsProYhViCOeVW10wgJIRz6TMRdzZQ/ADC+VdYUCQPzLJXeC4
	 mrcSpzvfaqTqg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20240616215226.2112-1-ansuelsmth@gmail.com>
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v6 00/20] leds: leds-lp55xx: overhaul driver
Message-Id: <171890216265.1289520.18025885103780443097.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 17:49:22 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sun, 16 Jun 2024 23:51:59 +0200, Christian Marangi wrote:
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

[01/20] dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
        commit: 08a9d2e79140ea1b40c107ea4c025bb8b71aa4b5
[02/20] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
        commit: 75e28e4b32dda36c4a015cf2f9c4955d9024234a
[03/20] leds: leds-lp55xx: generalize stop_all_engine OP
        commit: e2176c637856cd206bf06b5bbba89b2cf45f7dca
[04/20] leds: leds-lp55xx: generalize probe/remove functions
        (no commit info)
[05/20] leds: leds-lp55xx: generalize load_engine function
        (no commit info)
[06/20] leds: leds-lp55xx: generalize load_engine_and_select_page function
        (no commit info)
[07/20] leds: leds-lp55xx: generalize run_engine function
        (no commit info)
[08/20] leds: leds-lp55xx: generalize update_program_memory function
        (no commit info)
[09/20] leds: leds-lp55xx: generalize firmware_loaded function
        (no commit info)
[10/20] leds: leds-lp55xx: generalize led_brightness function
        (no commit info)
[11/20] leds: leds-lp55xx: generalize multicolor_brightness function
        (no commit info)
[12/20] leds: leds-lp55xx: generalize set_led_current function
        (no commit info)
[13/20] leds: leds-lp55xx: generalize turn_off_channels function
        (no commit info)
[14/20] leds: leds-lp55xx: generalize stop_engine function
        (no commit info)
[15/20] leds: leds-lp55xx: generalize sysfs engine_load and engine_mode
        (no commit info)
[16/20] leds: leds-lp55xx: generalize sysfs engine_leds
        (no commit info)
[17/20] leds: leds-lp55xx: generalize sysfs master_fader
        (no commit info)
[18/20] leds: leds-lp55xx: support ENGINE program up to 128 bytes
        (no commit info)
[19/20] leds: leds-lp55xx: drop deprecated defines
        (no commit info)
[20/20] leds: leds-lp5569: Add support for Texas Instruments LP5569
        (no commit info)

--
Lee Jones [李琼斯]


