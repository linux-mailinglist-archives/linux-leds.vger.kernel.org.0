Return-Path: <linux-leds+bounces-3090-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F1E99E1F1
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 11:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B595FB214CD
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 09:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84EB1A76A4;
	Tue, 15 Oct 2024 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahxqUWl+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AA0146A9B;
	Tue, 15 Oct 2024 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728982866; cv=none; b=l0awvAv/TpPujozYcXgkdnVTbaTFzcAR6T8MVZ2GipIgK+KjWdiV3xkmJ67NMgep4lLrkm1w+gK+v4wf2xyLfuAiyB+uVKQ3suiLgUjA/mwX7Ma20HUpKEi+k/eK7Ms/+nO7ZAbyB3Pzoi4dLKU9TBy8sRyHph+r9osfFdASHNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728982866; c=relaxed/simple;
	bh=lJ8HD5pv/yonE+VcIeYnDXAzDKMADySdBQNIxgIO9JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyY+pThHSKLHxNYiR58iC+CIIcSb/VnQurnKUHS7wsJ1LthWg+Y4eR8r3suQweHSaviQGeJjxDbddV4+oGYv4Mc5vjig0W7G9dPS1M42aTLJg6cmbqeusSIuRta55u4HISZL4KxSmNdkeAcfcjFE1J4RIOp5cb3zRMN1vC2DbzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahxqUWl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1269CC4CEC6;
	Tue, 15 Oct 2024 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728982866;
	bh=lJ8HD5pv/yonE+VcIeYnDXAzDKMADySdBQNIxgIO9JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahxqUWl+yL5Y6W6nil3RzDfmARA/l2pSzS5ov6Z6Owp6qaREq0S7bX3QQNk4zQh14
	 AF9mcG77d+t1ojv8EbjeJ6frjgTX6usr91/ZXUjMzI8AICOROMRGkZUXFzBRPoAsDC
	 DtDw95YG5uNKYMXyv9ae2oY2jHRna+mE8bvVlojSEGnHhydUAIsCsVZDW/yvMP+9Ce
	 l2Rjphv7dzn6ZkEiqICdW7jEMJfcKUiDYXkCXyXZ4pInjVjVQ6ugdKAnjxUFTmHT7d
	 oLEeNBUibcqr3U1cN9R3NiYJb9BErgd7TaubE64IzzildDLZG6HqHPUvVKV71Ctzky
	 MJt8AFJsMPTrw==
Date: Tue, 15 Oct 2024 10:01:02 +0100
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Dipendra Khadka <kdipendra88@gmail.com>, avel@ucw.cz,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: leds: replace divide condition 'shift / 16'
 with 'shift >= 16'
Message-ID: <20241015090102.GD8348@google.com>
References: <20240922174020.49856-1-kdipendra88@gmail.com>
 <20241009133643.GI276481@google.com>
 <ZwkLCE9x5DWtaaJU@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZwkLCE9x5DWtaaJU@duo.ucw.cz>

On Fri, 11 Oct 2024, Pavel Machek wrote:

> Hi!
> 
> > Staging!  Why Staging?
> > 
> > On Sun, 22 Sep 2024, Dipendra Khadka wrote:
> > 
> > > Smatch reported following:
> > > '''
> > > drivers/leds/leds-bcm6328.c:116 bcm6328_led_mode() warn: replace divide condition 'shift / 16' with 'shift >= 16'
> > > drivers/leds/leds-bcm6328.c:360 bcm6328_led() warn: replace divide condition 'shift / 16' with 'shift >= 16'
> > > '''
> > > Replacing 'shift / 16' with 'shift >= 16'.
> > 
> > More info please.
> > 
> > - What is the current problem you're attempting to solve?
> > - How does this patch help with that?
> > - What are the consequences for not applying this fix?
> 
> Take a look at patch. Doing shift / 16 when testing on >= 16 is just
> ugly. It is simple cleanup.

You missed the point of the comments.

Copying / pasting the warning into the subject-line and commit message
without any additional wordage is sub-optimal.  Please improve the
commit message.

-- 
Lee Jones [李琼斯]

