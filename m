Return-Path: <linux-leds+bounces-4270-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A342A60F78
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 11:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D811E7A9CDA
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 10:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3301FCFE7;
	Fri, 14 Mar 2025 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWmc+Z14"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58361FCFE3
	for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2025 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949874; cv=none; b=dj1BDNON7R+C/uP5hj0qwB2txyAyAhTtUtRJDW0wljicmc3oixb5xxuJnNvjO6uwhc7c54OWsXF3Zll4YufyaxXLEemTZEs2caRlkF6e4CZySgOkkBKXv2puoKKRv5/IJUFuG3UvG68ekN49shF0mpokQOunGp6b+SKGx5K8E/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949874; c=relaxed/simple;
	bh=Ln1PYHR+Ire2Uw3F5dzeU+fhb+rYb3NZVwgEc6Yd+Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=df+PFezoH92LMsPrBfyHL4F7J4WzR67MZUGA5uofUGZrlfwt4fvzHqI5+Uupmn6eD1uOzJsontMTYOkyHzDaXkIqhmSKZGmMMCHSByS4SvM9Tf2CR5XPon7wzpy2wKjiLs9tOnEkzviqkEbUCs4yDAPcCGfhzq7AJjQCUn50T84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWmc+Z14; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46B8C4CEE3;
	Fri, 14 Mar 2025 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741949874;
	bh=Ln1PYHR+Ire2Uw3F5dzeU+fhb+rYb3NZVwgEc6Yd+Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWmc+Z14i6I2J14D7RIA4kChoErt7rV0/jB7xbVwhwzGAKskzo1jZAD2wue7Khsck
	 wv4nS4JcGfb6tLOts5f63KV1Mw2HxatGjWfbZFaykpA+eVf/ex2aEEz4YImUCJCHM6
	 khxBJQCJqFek0JalQ8vq01g7Q/d9FRJsQuAWPMlG5uBx5UXlTCrAoZh3ROyqRGgQzb
	 o6+J4yPfpxPyF2Jma8A7/ZXzJNAMbbzxv2AkMLaJfy9oRbNJPPkxO9yQpSE89oU5ky
	 aLfvvOb482i8bbrnn1msetOXOSi5pLRh0vxCqOap4HeoIgS8FPwF14XbL7fbkOrtZU
	 9QDe6r9XwXGdA==
Date: Fri, 14 Mar 2025 10:57:51 +0000
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 0/1] Introduce userspace LED triggers driver
Message-ID: <20250314105751.GE3890718@google.com>
References: <20250311013143.371930-1-craig@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311013143.371930-1-craig@mcqueen.au>

On Tue, 11 Mar 2025, Craig McQueen wrote:

> I've done some significant rework since my original submission of this.
> 
> * Moved and renamed driver to drivers/leds/trigger/ledtrig-user.c, 
> following kernel arrangement of trigger drivers.
> But note the char device name and uapi header file are still named 
> 'uledtriggers'.
> * Fixed a mutex reentrancy issue with the 'activate' function.
> * Code refactoring and add comments.
> * Add new documentation page to index.
> 
> Craig McQueen (1):
>   leds: Introduce userspace LED triggers driver
> 
>  Documentation/leds/index.rst        |   1 +
>  Documentation/leds/ledtrig-user.rst |  36 +++
>  drivers/leds/trigger/Kconfig        |  10 +
>  drivers/leds/trigger/Makefile       |   1 +
>  drivers/leds/trigger/ledtrig-user.c | 348 ++++++++++++++++++++++++++++
>  include/uapi/linux/uledtriggers.h   | 123 ++++++++++
>  6 files changed, 519 insertions(+)
>  create mode 100644 Documentation/leds/ledtrig-user.rst
>  create mode 100644 drivers/leds/trigger/ledtrig-user.c
>  create mode 100644 include/uapi/linux/uledtriggers.h

This is a fairly large inclusion.

I'm going to let this sit on the LEDs list for a few more weeks.

You should also consider always Cc:ing LKML, since a lot of useful
reviewers don't subscribe to all of the little subsystem lists.

-- 
Lee Jones [李琼斯]

