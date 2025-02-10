Return-Path: <linux-leds+bounces-3911-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0266AA2F4B8
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 18:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 296BC1888725
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 17:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF935256C7A;
	Mon, 10 Feb 2025 17:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9uw5oeL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B67C256C69
	for <linux-leds@vger.kernel.org>; Mon, 10 Feb 2025 17:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207393; cv=none; b=XPXb2R+VxSl/L7/bRU6SLr0hZ2xZFzHB7iadvLFJl/uPJ8gA2I2sAiehoyhfcgdx7MyOPs+s4HU5sZM7ixTiSxAmDVjLAkTzwXt3efN1gpE5qfL5e0r197mknahIN379GfnkqnLzdSYZEEzm8mhFNdxw0MZCL+qxgqG9P5TDZbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207393; c=relaxed/simple;
	bh=SUTMXqCsUhbB7T+Rl/lScXiQARKPddoYFa4v3CJxtNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRzWZ+1ibyIll+17uJnOd+6zBaaobWWV99OYu7EpeMrA7Uj5NcZicPr1dF4Q1Q0hKR/YpysaRQY/ZPchBvC+XdFSnqf1nhG3OKlPb4vs0KAxGkz3UpObVp3W+mYK8Ra97bL/WNhZhu0sd02AeKbuVBY+fWdFctRCtyQdlGJaGxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9uw5oeL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EEEC4CED1;
	Mon, 10 Feb 2025 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739207393;
	bh=SUTMXqCsUhbB7T+Rl/lScXiQARKPddoYFa4v3CJxtNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9uw5oeLA9rvPgmJ1uBw+g+vPqii+6sN+2HCb6RNqzdVxAr7SQDPsuWlOaYsydXKC
	 oqv62Zw4YkFEFprPTAY+cQ9Ez9ch1ykcDdeuxXR9qmUOVkXKpIlfi3vgti5dpllNCv
	 Cu9x0XJW3Fxd7Evz+k+aiy/AI5/t7q/ciTGk8dFVsN6mdLoomA71ts3UWiWoWokVmH
	 9U1kksAQRglKCHuLAnZq2ofo6NUguUjxd0PYd1+QuZBiCvuf6tH9PBX8YixvV4qRjR
	 tkyBUlu+rZepUYEGrM2FdnAZ2J8t7ffcjzDfQ54bI9zvMI5QxfBJXgUWJGBa0ylPUh
	 DCfgjKeuBVbUw==
Date: Mon, 10 Feb 2025 17:09:49 +0000
From: Lee Jones <lee@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: linux-leds@vger.kernel.org
Subject: Re: ledtrig_flash_ctrl and ledtrig_torch_ctrl
Message-ID: <20250210170949.GG1868108@google.com>
References: <Z5WfSYiANGBXgdW8@gallifrey>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5WfSYiANGBXgdW8@gallifrey>

On Sun, 26 Jan 2025, Dr. David Alan Gilbert wrote:

> Hi,
>   One of my scripts noticed that ledtrig_flash_ctrl() and
> ledtrig_torch_ctrl() don't seem to be called anywhere,
> and don't seem to have been since they were added in 2013.
> 
> Are they actually deadcode I can/should remove?

I would ping the authors first.  If there are no good reasons to keep
them around come back, you can remove them.

-- 
Lee Jones [李琼斯]

