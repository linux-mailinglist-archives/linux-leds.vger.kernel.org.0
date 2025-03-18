Return-Path: <linux-leds+bounces-4302-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B52CCA66F3E
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 10:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDEE0422088
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 09:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B24E1F8756;
	Tue, 18 Mar 2025 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyaw2Rew"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BC31F866A;
	Tue, 18 Mar 2025 09:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288745; cv=none; b=V3CFyi+40zlh+owTNrKO3N/7YUMPEMr2boeHuN8aWOnRh/HqnyZp+7k/GhrpHaTdwhJebHTLkol8mO9SE5F+Q/sQaFNxQ1pt6//Dng9wO6KKR1x92dX5sWs4gUarmmkDO+cccQjD9WNrGngr93jUXxdDTogl/6z2A+M80I8dAoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288745; c=relaxed/simple;
	bh=NQHQfnaphrcglH/8XP/KnT9iOjM0YytcMgrIGKaiLKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNbTnFMTpvoBISLY5ngmt8XmOMY6f+wxetxCtM8XZ3s7bJhSYGByUC8p24FLxQ9q+vXV3wa9X6PiQlVEg6a/9Jf0J9AAxVSJm1pudjnxrXuMztQaDYnY1NX53IMjbAPSrMhBLc7Ju7e+SiurHCSpkRNJRLWDery0U+/Bs2ZZ+Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyaw2Rew; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC16C4CEDD;
	Tue, 18 Mar 2025 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742288744;
	bh=NQHQfnaphrcglH/8XP/KnT9iOjM0YytcMgrIGKaiLKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyaw2RewTrR9KRMlO/y78jNE+Ob3LtMw3MhozkqeV4KRSJ2hBi5KKBNf5FhHUmr8c
	 OQH5zP5bew7XpsktPpAQ6RUxiQKKhvqMufsZqTuRQX92/+nt/5R90pAkDu2aKMeZsp
	 RkB2CWHQwFugI4grS9EEW1jpza/MPm2wYtA+RXTMfM7mWEyI47PFeAABKSVFvThsHx
	 +THMf/PeWMdPzf2y9DZ25hquShEFofTvSlUKz7na2iB8LFuUGzOEU9Q4iVLp+mg0T/
	 MCnSzt7pzHpi0PH+kH40laJz6HhwYDaDWTNVykCqe+m4jgHiraQgP9nah2wnx39mad
	 icJqJfa1iAl0w==
Date: Tue, 18 Mar 2025 09:05:39 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 04/11] backlight: Implement fbdev tracking with blank
 state from event
Message-ID: <Z9k3YxOy26OyFnbS@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-5-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-5-tzimmermann@suse.de>

On Thu, Mar 06, 2025 at 03:05:46PM +0100, Thomas Zimmermann wrote:
> Look at the blank state provided by FB_EVENT_BLANK to determine
> whether to enable or disable a backlight. Remove the tracking fields
> from struct backlight_device.
>
> Tracking requires three variables, fb_on, prev_fb_on and the
> backlight's use_count. If fb_on is true, the display has been
> unblanked. The backlight needs to be enabled if the display was
> blanked before (i.e., prev_fb_on is false) or if use_count is still
> at 0. If fb_on is false, the display has been blanked. In this case,
> the backlight has to be disabled was unblanked before and the
> backlight's use_count is greater than 0.
>
> This change removes fbdev state tracking from blacklight. All the
> backlight requires it its own use counter and information about
> changes to the display. Removing fbdev internals makes  backlight
> drivers easier to integrate into other display drivers, such as DRM.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

