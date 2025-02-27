Return-Path: <linux-leds+bounces-4113-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F5DA48506
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 17:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 274AB3A3A58
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 16:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448241B0421;
	Thu, 27 Feb 2025 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TN0VEc7F"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156A31ADFE4;
	Thu, 27 Feb 2025 16:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673714; cv=none; b=GJb1pmv+6+iFITg5ipB5vgj3noClCfWN7EcWEYesuRIbhS3f2jAE/thEURwb1OHW2H2Jo4Ex/TOvVtl4KpsgtIg7QptAnYfo0sOwkns1RQBuJS2MCbjYhjioLYzv4V0E1Jour7loowjuLUcoagR3VWBx7AgPa9WbGMPZpfbq3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673714; c=relaxed/simple;
	bh=2iBidgsKtTbg0E7ehuShbszFLmDzVWzb65EighhQS9w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FOBW4aI3mzAKNJh0cZHnvRGcMDYEDrcwLuTKcH/SjtuwyjDOT55HUH3zS9h6G8e26li2r8aITbSozcPzUBo01jS+eKsrATaJecVPvEvgurRqnt1xI3aLHPZO6gvHVtm+dJWlaEBTxGJfGihy+XQqJzGFwbeAwd91FEQPGSD6Unk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TN0VEc7F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F89C4CEDD;
	Thu, 27 Feb 2025 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740673713;
	bh=2iBidgsKtTbg0E7ehuShbszFLmDzVWzb65EighhQS9w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TN0VEc7FnvH7troPAhz266xeyNUOCDKTt3BnuQI6leHzpf5y21du2OhHY/hELP1x0
	 p5AOlgYg30eFgS/DDTuNb9NgN6lN74Zs+RWW92a/IA0FhwO6ZBDLOR9RFGoaFhCfH8
	 FNw9T+mWQvfnbZEIDTBJ9E7WfW4JAVAniRp8tXBGPYGjKdd+5a8QESQTCgLsUPLXIZ
	 GvDjLD9mLcMGmVZvuhfOqWPKXK2O56vW8GA40RLFqUOe3AZQbXS00BsZfGjhy1SM0g
	 GVmOt/9Pn6q5/m8K8VOTo6zJ2Fq59HU+mppLTXUDkTPYAuuyzOyhzi//0vTvqyIVtE
	 gKbnVVJDqaw/w==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Remi Pommarel <repk@triplefau.lt>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <19c81177059dab7b656c42063958011a8e4d1a66.1740050412.git.repk@triplefau.lt>
References: <19c81177059dab7b656c42063958011a8e4d1a66.1740050412.git.repk@triplefau.lt>
Subject: Re: (subset) [PATCH v2] leds: Fix LED_OFF brightness race
Message-Id: <174067371203.3568117.5632131578268185238.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 16:28:32 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Thu, 20 Feb 2025 12:23:17 +0100, Remi Pommarel wrote:
> While commit fa15d8c69238 ("leds: Fix set_brightness_delayed() race")
> successfully forces led_set_brightness() to be called with LED_OFF at
> least once when switching from blinking to LED on state so that
> hw-blinking can be disabled, another race remains. Indeed in
> led_set_brightness(LED_OFF) followed by led_set_brightness(any)
> scenario the following CPU scheduling can happen:
> 
> [...]

Applied, thanks!

[1/1] leds: Fix LED_OFF brightness race
      commit: 2c70953b6f535f7698ccbf22c1f5ba26cb6c2816

--
Lee Jones [李琼斯]


