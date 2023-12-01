Return-Path: <linux-leds+bounces-227-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C1800896
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 11:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E02AE1C20A37
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 10:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4697220B1A;
	Fri,  1 Dec 2023 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2tlZ2qE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A49920B18
	for <linux-leds@vger.kernel.org>; Fri,  1 Dec 2023 10:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1B2C433CA;
	Fri,  1 Dec 2023 10:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701427243;
	bh=MUxGg67sGjrRyrFbECfUufgp71bKjdNxv9joWnz9hRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k2tlZ2qEhFpx891blljms3LpcFGEXY9W5UHkhHal1WIT49yKLYz8Dt81SGiHyDpOA
	 hvT6jZveUxAFWV78PEBHh8BiQMC+IPShxlLeLGKe4+Ze7+WltVvzAndxGpzGd3FUfB
	 H+FrXXbCmXCY5423AhP2B3+Z1pphR01P50fKBTNHGw75B/1WeuGkC/GFrJMucMAegZ
	 L3GReFQgkDoShwVfFNUe1teinX9zOww3DeUTn+HjLRngvhyc9yEG24uywK9dx45Hcy
	 roAPVVpUCucSjirr4ZJIgzqO8KqILL+GHXBvFPYQgmFg6nPefhG24S0q0LnZ5C3s21
	 u+l9Bqb7o939A==
From: Lee Jones <lee@kernel.org>
To: Eckert.Florian@googlemail.com, pavel@ucw.cz, lee@kernel.org, 
 kabel@kernel.org, gregkh@linuxfoundation.org, 
 u.kleine-koenig@pengutronix.de, Florian Eckert <fe@dev.tdt.de>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231127110311.3583957-1-fe@dev.tdt.de>
References: <20231127110311.3583957-1-fe@dev.tdt.de>
Subject: Re: [Patch v9 0/4] ledtrig-tty: add additional tty state
 evaluation
Message-Id: <170142724145.3350831.5316050550655479371.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 10:40:41 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Mon, 27 Nov 2023 12:03:07 +0100, Florian Eckert wrote:
> Changes in v9:
> ==============
> - As requested, I have removed the memory leak fix patch from the previous
>   patch series v8 and have send this patch directly to the stable
>   mailinglist [10].
> - I also have removed the not needed wait for completion code path on
>   sysfs attr store and show, for the new configuration options, as
>   requested by greg k-h [11].
> - Patch v8 3/6 dropped, because the change is not correct as mentiond
>   by greg k-h [12] and this part of the code will be removed anyway
>   in this patch series.
> - Update naming of the function ledtrig_tty_waitforcompletion() to
>   ledtrig_tty_wait_for_completion() which match better with the API call
>   function wait_for_completion_timeout().
> 
> [...]

Applied, thanks!

[1/4] tty: add new helper function tty_get_tiocm
      commit: 5d11a4709f552fa139c2439fead05daeb064a6f4
[2/4] leds: ledtrig-tty: replace mutex with completion
      commit: 50744fe65a4c8b78eff9a4b70825dd7c768f9f69
[3/4] leds: ledtrig-tty: make rx tx activitate configurable
      commit: 8e7b857c0eafdc49ff0e63e9252ed0273b9efdbd
[4/4] leds: ledtrig-tty: add additional line state evaluation
      commit: 7f5a46671b2253989b2674407d624f1fcc77d60f

--
Lee Jones [李琼斯]


