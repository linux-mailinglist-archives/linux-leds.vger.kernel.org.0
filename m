Return-Path: <linux-leds+bounces-782-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985084DE92
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 11:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8F862819FC
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 10:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8296A352;
	Thu,  8 Feb 2024 10:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/Bui+TC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F028B2EB14
	for <linux-leds@vger.kernel.org>; Thu,  8 Feb 2024 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389160; cv=none; b=OG1YAVPlAyGhi8Oy/m5yCS9J2cHNcqIDBdD3YL9KvF8rkvErPGt1g7YzhldzJdSYzKqleuuRPzX7jONgIkQX/sNqXFWGe9Ej0136lx9oyjAFMm35jUeLM6tutGkUHMYgWMbqNtMCkel5PSkFRkeOAflU9TLUdijHGXWxlW1M8u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389160; c=relaxed/simple;
	bh=UHcvFKtKMgYX7JwqQL5YgAmB3qalwsu7luXERAWUJsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+VqBfRfqPEff9wIlU2+ZLJ3CWb2hBwPic6Q9b8gPy7EGa+NkA2IpXgBYlP7fNgUnzBkzH7Mo6tRX5sbdBUbc+hZht46VDodpj546qTfSIqj0VmlCnHInSMbJNKq5kRS25o1ddsCHjrGtlu8gSBUeTmNco4WIg3p8+tDrsG2ARU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/Bui+TC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D26C433C7;
	Thu,  8 Feb 2024 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707389159;
	bh=UHcvFKtKMgYX7JwqQL5YgAmB3qalwsu7luXERAWUJsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/Bui+TCH4S8K1wPttR0obqe4p/UeB04FhYBoMLFRMmEisPYmFkgxnl2XPJk2GoC7
	 FzGvWjZJ5Xt/RiFJuzircJrZHk752ZElzTUIgxb6iYD7RqxWO4GC0CD/9Gmgbh3y15
	 URPrlODk1WuA4F9BnNxYGUQ+/JMmZCCyJ7u6Akvkb0PytBC3+xzU0IYbUIwGDFnYfa
	 bNHgHntNhW3xZaFWKeWd83co+VzIDoid13QgEntVLJxJvzUzejXKoGDR3KZ5II3sie
	 sQ4tPo3HHjQ2HSqFmGs7Ma1GhgEeGACfGEbx+eBf+NIXtBfADoDZEl4hmPwhXUhQpL
	 n9yLUSiZ8h44g==
Date: Thu, 8 Feb 2024 10:45:55 +0000
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: (subset) [PATCH] leds: trigger: stop exporting trigger_list
Message-ID: <20240208104555.GH689448@google.com>
References: <ca185fb1-3a66-46b9-920e-bfecbe39c6bf@gmail.com>
 <170738775519.907987.8656098604510646583.b4-ty@kernel.org>
 <20240208102340.GE689448@google.com>
 <648b58db-6fb0-4b9e-8d63-ecf193f2e38a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <648b58db-6fb0-4b9e-8d63-ecf193f2e38a@gmail.com>

On Thu, 08 Feb 2024, Heiner Kallweit wrote:

> On 08.02.2024 11:23, Lee Jones wrote:
> > On Thu, 08 Feb 2024, Lee Jones wrote:
> > 
> >> On Wed, 31 Jan 2024 15:30:53 +0100, Heiner Kallweit wrote:
> >>> 682e98564ffb ("leds: trigger: panic: Simplify led_trigger_set_panic")
> >>> removed the last external user of variable trigger_list. So stop
> >>> exporting it.
> >>> If in future a need should arise again to access this variable, I think
> >>> we better add some accessor instead of exporting the variable directly.
> >>>
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [1/1] leds: trigger: stop exporting trigger_list
> >>       commit: 6171582edb46889769d994cca81cf0f0fdd8c66f
> > 
> > I fixed the chechpatch.pl error for you and changed the subject line to
> > match the format expected by the LED subsystem.  Please correct these
> > yourself in subsequent contributions.  Thanks.
> > 
> Sure. What was wrong with subject line?

Descriptions after the `leds: <device>:` start with an uppercase char.

It's nitty, but consistency helps me sleep at night! :)

-- 
Lee Jones [李琼斯]

