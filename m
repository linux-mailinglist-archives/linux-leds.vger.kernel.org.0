Return-Path: <linux-leds+bounces-2148-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A283A9186BC
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2AC11C22882
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CD818FC75;
	Wed, 26 Jun 2024 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1tlouAF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E6D18FC6E;
	Wed, 26 Jun 2024 16:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417724; cv=none; b=VYtSVC10M4GK30zPhQc5lIARGcXjSvFDDVlSQKpekDPboRlC5459AxE00UDfXEGrxtLzM8qgN5pKKmwOa9UQEjCXgC413ud0w70/AQkwOOJ25ecPiiNZ9EelXLegb7L8yIyOUQLqjTjlLlGW7cKOyJEHI419x1ZEEU3QRvH58aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417724; c=relaxed/simple;
	bh=Zg9n5/olVBL7n33dDRqfTrTXqjMG2LXJK0vPq2Bdtyg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UCSfA8Cl51Yt8TL66Q8IM0XnAzyssvzXqpSGjt3V4BxVtp8MqVS50nUJPBSxZv2IL4GMwv00eNV0x/ed2TeAkDuRnAoX0vfs9PO/6DePJhy/VB/WUk2T6vcQH1nvn/WF5TWy+6e3EdmD1Bltzsdzl+1+tzfDkhinGcOjWvoYbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1tlouAF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09AFC116B1;
	Wed, 26 Jun 2024 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719417723;
	bh=Zg9n5/olVBL7n33dDRqfTrTXqjMG2LXJK0vPq2Bdtyg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=C1tlouAF14BQDqglTKG27wYn7Slne7HeOmm9WpvZChErIgOVAvP/335aZzWQboSP6
	 FrR0/Ojv3zEjMmFo5/kAga2oRGp+mOiqUpQ5+pebZ/F12kqTm9CsPS1pKD8VXLRnj/
	 JHi0FmoLyrqIc7URaNiub/7qvtp/RGHPzc2yGEWD4johN+vdFlyvU8C7/D5AkbEHeX
	 IcAntVqQkSr4Y087yBBHToJ7Fy0OYZM+dQygHrfYRjF49uvuq1+jRBEHUwXGbRuAgt
	 TsBu1Q+3edFsnpRwHpR+CAW8EwcZEpDsihSnygSmxl8QxBbGVI9n+xMKR8azhXeNp9
	 arke5Z0i+d1NQ==
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
Message-Id: <171941772170.2536029.9839972816836962325.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 17:02:01 +0100
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
        (no commit info)
[02/20] dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
        commit: c4bd4feece4103388d15c99461741604fec0ebbc
[03/20] leds: leds-lp55xx: Generalize stop_all_engine OP
        (no commit info)
[04/20] leds: leds-lp55xx: Generalize probe/remove functions
        (no commit info)
[05/20] leds: leds-lp55xx: Generalize load_engine function
        (no commit info)
[06/20] leds: leds-lp55xx: Generalize load_engine_and_select_page function
        (no commit info)
[07/20] leds: leds-lp55xx: Generalize run_engine function
        (no commit info)
[08/20] leds: leds-lp55xx: Generalize update_program_memory function
        (no commit info)
[09/20] leds: leds-lp55xx: Generalize firmware_loaded function
        (no commit info)
[10/20] leds: leds-lp55xx: Generalize led_brightness function
        (no commit info)
[11/20] leds: leds-lp55xx: Generalize multicolor_brightness function
        (no commit info)
[12/20] leds: leds-lp55xx: Generalize set_led_current function
        (no commit info)
[13/20] leds: leds-lp55xx: Generalize turn_off_channels function
        (no commit info)
[14/20] leds: leds-lp55xx: Generalize stop_engine function
        (no commit info)
[15/20] leds: leds-lp55xx: Generalize sysfs engine_load and engine_mode
        (no commit info)
[16/20] leds: leds-lp55xx: Generalize sysfs engine_leds
        (no commit info)
[17/20] leds: leds-lp55xx: Generalize sysfs master_fader
        (no commit info)
[18/20] leds: leds-lp55xx: Support ENGINE program up to 128 bytes
        (no commit info)
[19/20] leds: leds-lp55xx: Drop deprecated defines
        (no commit info)
[20/20] leds: leds-lp5569: Add support for Texas Instruments LP5569
        (no commit info)

--
Lee Jones [李琼斯]


