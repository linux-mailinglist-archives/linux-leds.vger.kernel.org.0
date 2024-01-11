Return-Path: <linux-leds+bounces-591-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4B482AF2D
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 14:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E169F1C21043
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 13:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C4D15E99;
	Thu, 11 Jan 2024 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDizyBTT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0CC15E95;
	Thu, 11 Jan 2024 13:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B3CC433F1;
	Thu, 11 Jan 2024 13:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704978317;
	bh=7+NXqXzNwrtcAjYwpfHcy7Mr4As+DOX24vXMzISRV0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDizyBTT4lUdyw6rCv8zKAHmwqw9LtW27IVv7dKksbPQeC9Z3oqWMmOjn390dkdzZ
	 kPoNfFQzA48DhuvJf64lXaH7VWrSstpy0HFl4FAdAqvNSONMfe+oaXS/oulgj4zU+c
	 yV5apq4uwFRh4xInD/ZE11WR0k7ClBu3NUU+iReeosAHgyXf58pMnL2F/28BWievZS
	 Uwp3RNTMBAABpRXRqlcoGx5V5qcrib+f7kEbu5IrO4DovdzWhOS2I85EjCXEXqZ9Go
	 d5e1WW6ruE5t8YmUTorzrYjhvsWuP8CtPSo8zSNX0fh0ZfFij6vxjEMJvAcSL+xj57
	 8UpB5XJGRSIzQ==
Date: Thu, 11 Jan 2024 13:05:13 +0000
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>,
	cocci@inria.fr
Subject: Re: leds: trigger: oneshot: One function call less in pattern_init()
 after error detection
Message-ID: <20240111130513.GK1678981@google.com>
References: <c73761c5-7150-4f20-9b3e-1da680400250@web.de>
 <20240111104109.GB1665043@google.com>
 <58d6b9d0-a2d6-4d8d-bc36-fe783839ca79@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58d6b9d0-a2d6-4d8d-bc36-fe783839ca79@web.de>

On Thu, 11 Jan 2024, Markus Elfring wrote:

> >> The kfree() function was called in one case by
> >> the pattern_init() function during error handling
> >> even if the passed variable contained a null pointer.
> >
> > It's totally valid to call kfree() on a NULL pointer:
> >
> >   * If @object is NULL, no operation is performed.
> >
> > Why do we care all that much?
> 
> Would you dare to categorise such special function calls as redundant?
> 
> Should they be skipped in more cases?
> 
> See also:
> https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resources

I have no idea what you're trying to say.

The premise of your patch is based on the fact that we shouldn't call
kfree() with a NULL pointer.  When in actual fact kfree() is more than
capable of handling cases where the passed object is NULL, and goes as
far as to document as such.  Meaning that unless I'm convinced
otherwise, patches like this remain in the category of churn.

-- 
Lee Jones [李琼斯]

