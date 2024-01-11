Return-Path: <linux-leds+bounces-573-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 116CB82A949
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 09:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A09A028618A
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 08:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642E2F512;
	Thu, 11 Jan 2024 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3lCI9b+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470EC10A2F;
	Thu, 11 Jan 2024 08:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DF9C43390;
	Thu, 11 Jan 2024 08:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704962669;
	bh=0nfN0jXa8If+AOKA0QftSzZaWPjBWS5C/cukTLMv5v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3lCI9b+YBDhgiP8uFMcEWtgry1Wc0/9v3ZhYQ+7u0z8akQr8a0EIL3VXtPmORsMp
	 l2VIM2vAEQ6Yaby/OiqX5yyu8YYkEe/pQqdaZ5WJ8sDrUoy7iR+tK1MAq2vCoPMwyr
	 SXvpt/IwsJoZOnepShzSy4sR9yNzffmND+e4uH805N1mVL8hTmxPokiOUEHxHHyf/K
	 jVftm0E+5GHTBbr0RJpY8jY+QgTQYUqaMrlmZW+HxyIrTa0vl+7jJ4GlqPWtQSmIHD
	 ZpHsU0k3yhQqPAnpBjA2BNlpQclBjXkt61V/4BR2ubfGJt8djNi9Dg5gUZMjh5MWq3
	 zOX0Mtmp5c/Xw==
Date: Thu, 11 Jan 2024 08:44:25 +0000
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH RESUBMIT] leds: trigger: netdev: add core support for hw
 not supporting fallback to LED sw control
Message-ID: <20240111084425.GJ7948@google.com>
References: <3fd5184c-3641-4b0b-b59a-f489ec69a6cd@gmail.com>
 <7b6cf0fb-4c77-4088-b87b-5649cfaa697e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b6cf0fb-4c77-4088-b87b-5649cfaa697e@gmail.com>

On Sun, 17 Dec 2023, Heiner Kallweit wrote:

> On 17.12.2023 19:46, Heiner Kallweit wrote:
> > If hw doesn't support sw control of the LED and we switch to a mode
> > not supported by hw, currently we get lots of errors because neither
> > brigthness_set() nor brithness_set_blocking() is set.
> > Deal with this by not falling back to sw control, and return
> > -EOPNOTSUPP to the user. Note that we still store the new mode.
> > This is needed in case an intermediate unsupported mode is necessary
> > to switch from one supported mode to another.
> > 
> > Add a comment explaining how a driver for such hw is supposed to behave.
> > 
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> 
> For whatever reason this patch (original version and resubmit) doesn't
> show up on linux-leds patchwork. In netdev patchwork it's visible.

Never used it.  Do you have a link?

-- 
Lee Jones [李琼斯]

