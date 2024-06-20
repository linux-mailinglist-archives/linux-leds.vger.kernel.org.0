Return-Path: <linux-leds+bounces-2070-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B78F910E37
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 19:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D45B1C24573
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 17:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B5C1AF6B4;
	Thu, 20 Jun 2024 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6r8GOq6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72F01AC24B;
	Thu, 20 Jun 2024 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718903715; cv=none; b=dnfzBY3IsVGCQ9VlUNfllLRsKA1jwuoZehr5nUiDyxOrYL/zSFEHPSxiS3kpxT3Q457gnhcEdaiZwTaHJ4/uw7D4LUkPkhHXZLWUhO4xKD89e4UF93/6ceeDCDo9SiC2LXVfLn+bbe4fSqbaCD0+CetGVUneQ7DU1IdSaStiw0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718903715; c=relaxed/simple;
	bh=8KvJ7FoFzu9ZeDk0DirWCSrub0dxRfclV6uRtxXb40Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMR61afU9ZcrHi13KSi9uYBgvAQgxSneNPhtmmlBtLCWpVU7gi1YcMjvDq0LNy2V8GmpetFhmWsYa6YigRXV2hSzzjLDSJ1zBei7zXeiXPdISET27P5KKd96SPZUMl6w+qzG8wPuUsJik6RJiBQ1qLjUPEntcIUCneXcwIC35FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6r8GOq6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06257C2BD10;
	Thu, 20 Jun 2024 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718903715;
	bh=8KvJ7FoFzu9ZeDk0DirWCSrub0dxRfclV6uRtxXb40Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6r8GOq6fIENzFtLTaECnIKMrjIjYtBKAeXVhUXCb3SCIwbYhnbHy11Sbv8QKHvmb
	 hfwNCNib89WKq8LhBeWCwuawyMK9dqOZ4lBDEXins8Hs8KFv0HdJJKQO90bz1N7EWS
	 hlsjCpu1LBUTZKHu7ztydazPw6cSBfioRQDyiLWk8awBlGUTfCXyG0VHawy9ujdZvr
	 ql0jogJTeefYRm7VjiPct1zmksdFwHaAtPeqqPXINhA/40Qvkf6OLGSSSIu7M94N2H
	 c7MVuqlxJbSACZjCeisLIH+5V+sVZvqsdJvkLK4XDeOus19kLLzWmnh5qy0RdFg4vo
	 Gju2A59Mmn1GA==
Date: Thu, 20 Jun 2024 18:15:11 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: cros_ec: Implement review comments from Lee
Message-ID: <20240620171511.GX3029315@google.com>
References: <20240614-cros_ec-led-review-v1-1-946f2549fac2@weissschuh.net>
 <20240620093114.GH3029315@google.com>
 <5708f5c6-65fe-4bf9-8d08-6dbb77e21a9d@t-8ch.de>
 <20240620122741.GL3029315@google.com>
 <478e23df-800a-40c6-b972-2af2d535b1ae@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <478e23df-800a-40c6-b972-2af2d535b1ae@t-8ch.de>

On Thu, 20 Jun 2024, Thomas Weißschuh wrote:

> On 2024-06-20 13:27:41+0000, Lee Jones wrote:
> > On Thu, 20 Jun 2024, Thomas Weißschuh wrote:
> > 
> > > Hi Lee,
> > > 
> > > On 2024-06-20 10:31:14+0000, Lee Jones wrote:
> > > > Definitely not seen a commit message like that before
> > > 
> > > I assumed that this patch would be squashed into the original commit.
> > > 
> > > My question in which form you wanted the changes should have included
> > > "incremental series".
> > 
> > Incremental means on top.
> > 
> > A lot of maintainers don't support history re-writes, but I've reserved
> > that right since forever, so I can squash it if you like.
> 
> If it is already visible somewhere and a squash would inconvenience
> anybody I'll resend it.
> But if not I'd be happy about a squash.
> 
> (I couldn't and still can't find the public tree where driver is in)

Odd, neither can I!  Okay applied the whole set again, squashed the
patch and submitted for testing.

-- 
Lee Jones [李琼斯]

