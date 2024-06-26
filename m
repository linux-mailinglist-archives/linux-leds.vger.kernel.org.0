Return-Path: <linux-leds+bounces-2151-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93751918752
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09965B241FF
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856C918FC82;
	Wed, 26 Jun 2024 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5kgtc94"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585CA18EFD4;
	Wed, 26 Jun 2024 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418123; cv=none; b=lMnqiDFeW7GJRSgHvfktToVCuTHRiUHtf623KQ6BnEI0bwjQmGeSeHp8uPHyZ0phJdWM1RFAsAGwz1bAmE6Mx3N01r24JWXPIhrdQQcr+Sv7JSsuNdSSweL7L8shr3xG2x6MT2bSQUnHHXbwWgOww4/aydE0diArsPCTJdh49Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418123; c=relaxed/simple;
	bh=WZwsFv8ugBAItIsIyreIZWoVdpFoYhHVtcN66PqlRtU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GoiwkyS3JGKbGVIe02YtcBBy409oF/Ilen1zEJlwQ7lSbsKN1tO1RP2JZw7s5XrznvdYlFnFz7fQ/Xn5ieUV6ZyczGV34MxXxAJeDRfYIHdAvlJ9rAScX+Mk+yfXzra5ajTOx+CrP6pNjB9StL6W0cx4nbDZR15t+z2TaXd7rnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5kgtc94; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ECEC116B1;
	Wed, 26 Jun 2024 16:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719418122;
	bh=WZwsFv8ugBAItIsIyreIZWoVdpFoYhHVtcN66PqlRtU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Y5kgtc94gySCSI0lXtqwvrP0lI7rfenXwX4NbvvXH79W/jIRontEKbPuz+xmP3xUb
	 YfouB65GVWCEoi9vrzag7zUNUx7sgR8+5wl2zSPH0zMlSUP7kRBXnsQSpYimqw+NwH
	 PfOrj2aLSkKJbU7bkfr9j53ABLoaSytsytgiaIrqQZ9b2eus7CLlgeykrkpOcQj2b4
	 USmM/QrHNLxMajrZitnxCT7b39om+egLGCDhQci1rYG/gJziA/ypVS22+FXegMreXU
	 WcnJ5rurQSduxmfkU+Trvu0ckzZTLTvUEjTPYpFbatgc2w9AV/6NUOaPFOswS5bGEa
	 PktFRVWeD7iVg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20240620210401.22053-1-ansuelsmth@gmail.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v7 00/20] leds: leds-lp55xx: overhaul driver
Message-Id: <171941812083.2542017.2881884570638704894.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 17:08:40 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 20 Jun 2024 23:03:16 +0200, Christian Marangi wrote:
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


