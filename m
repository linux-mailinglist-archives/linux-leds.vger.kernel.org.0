Return-Path: <linux-leds+bounces-581-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5582AC0D
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 11:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3450B25AEF
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 10:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADF914F67;
	Thu, 11 Jan 2024 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EG094XNy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70814F62;
	Thu, 11 Jan 2024 10:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F28C433C7;
	Thu, 11 Jan 2024 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704969160;
	bh=ADF+g6oD8JBOYnP+86FGF8zatUYNiNLMIOszR08Mtwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EG094XNyhvQjjlZ2qfIMKJ6oft9lSavwVCo8x88lmYso00gFGJtfVX9qR6054WTfx
	 HL9YbAu8yB0GNh2hfaHELTbTCm5cLtGejjFshVTDhoFE2SRz++VCs/9bOX4LZfKts0
	 PkRaF1TO69Rng5TwQxuJ3r3FM57ThHdOKa+IzeMfs1EAUeGxYc5y8r/oOn9FCgJtWW
	 r+Ufv5nwMksAhshNypFMZMtj/3RUCSfCaI4nb91uzzNeJhPy2cbks1MPYSdsJWlj9T
	 oy6z846qfExOnhjWzsRxcjehtgK+Zza1/GwOwDWWgBjlT6MaH5VxguHz+6zYtF8e6k
	 wwYA+tOjCBNcQ==
Date: Thu, 11 Jan 2024 10:32:35 +0000
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH RESUBMIT] leds: trigger: netdev: add core support for hw
 not supporting fallback to LED sw control
Message-ID: <20240111103235.GA1665043@google.com>
References: <3fd5184c-3641-4b0b-b59a-f489ec69a6cd@gmail.com>
 <7b6cf0fb-4c77-4088-b87b-5649cfaa697e@gmail.com>
 <20240111084425.GJ7948@google.com>
 <f0838b86-f008-4f14-8910-61b393d0190d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0838b86-f008-4f14-8910-61b393d0190d@gmail.com>

On Thu, 11 Jan 2024, Heiner Kallweit wrote:

> On 11.01.2024 09:44, Lee Jones wrote:
> > On Sun, 17 Dec 2023, Heiner Kallweit wrote:
> > 
> >> On 17.12.2023 19:46, Heiner Kallweit wrote:
> >>> If hw doesn't support sw control of the LED and we switch to a mode
> >>> not supported by hw, currently we get lots of errors because neither
> >>> brigthness_set() nor brithness_set_blocking() is set.
> >>> Deal with this by not falling back to sw control, and return
> >>> -EOPNOTSUPP to the user. Note that we still store the new mode.
> >>> This is needed in case an intermediate unsupported mode is necessary
> >>> to switch from one supported mode to another.
> >>>
> >>> Add a comment explaining how a driver for such hw is supposed to behave.
> >>>
> >>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >>> ---
> >>
> >> For whatever reason this patch (original version and resubmit) doesn't
> >> show up on linux-leds patchwork. In netdev patchwork it's visible.
> > 
> > Never used it.  Do you have a link?
> > 
> This is the original patch in netdev patchwork
> https://patchwork.kernel.org/project/netdevbpf/patch/91e9f4c6-d869-45be-be72-ac49a3c3b818@gmail.com/
> 
> This is my patches in linux-leds patchwork. The one from Dec 6th is missing here.
> https://patches.linaro.org/project/linux-leds/list/?series=&submitter=6702&state=*&q=&archive=&delegate=
> However the resubmitted one showed up later.

AFAIW, that's not the official Patchwork for LEDs.

And as I say, I don't use it, so I'm not really in a position to comment.

Do we still have something outstanding?

-- 
Lee Jones [李琼斯]

