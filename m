Return-Path: <linux-leds+bounces-3223-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B399B7FBB
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 17:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93F921F21BA9
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 16:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DBC1A7AD0;
	Thu, 31 Oct 2024 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJtiNksE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099991A705C;
	Thu, 31 Oct 2024 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730391249; cv=none; b=UVAvzVpE7QqOMpShI7PW/jGKj80aTTUYtS37wFf9QKLQL2QAv/a7Fa2bbXkMLxXLWxCQY6KXueCj2E2E2ebwHJWRp9K8qrX6s5p+pV9U/+3mM/zu8XGITWKjuM1K4dVAuQNbkWA2La+kvruShguNYOCEX9QCCDdWEeJzGx3ei4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730391249; c=relaxed/simple;
	bh=5t6VVJNafCgV1I0Ifghcn9yyrAvs5qpB5kVMtgOn5cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhBIfI9QQTsYbeDO4LpS502kNKBNX03zWnwJEaCgnAbMc4okhl3isjk+RXg1ho5u5b/+nAgwL6M9m2TNibjg8UVc3UNqJE+lzERUgvgMIm1/k02j4vw9+QEdqGPytt9UuySDwSxm2l+pJaXnRTMUWCglKYoxx3v1jj0B3uKPFuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJtiNksE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26109C4CEF5;
	Thu, 31 Oct 2024 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730391248;
	bh=5t6VVJNafCgV1I0Ifghcn9yyrAvs5qpB5kVMtgOn5cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aJtiNksE+JeI8iORMT8f807ZRfCr2GnEmB195WPrqxwtRl+Tum1vXeGnfekhN6hSM
	 aqatg9kLMCcJkXHTdyYgWZmROusT1SDyYbfa2nqknRh4v1v2nsNC5kE/JETiz9UIcw
	 81+4qAtvqs5gvz0uFcQSus4PgNINN9ETgD2RuEOeknJRW2ZCMB5G5xLtmAayJjVpVh
	 SgmSQjqNY/PwXUv1pjO5iVLhuEQ66yfaCWXe2ldThVwcvG0EHISgfeRqEalJHXdEOS
	 xdMdtp8EHs9alfswbeVhWQwhiSrH/ibHl0IpL+OJ1dAFVkWDUXwTzUU4PPSNxb8fbm
	 1/r/042Zk9Fxw==
Date: Thu, 31 Oct 2024 16:14:04 +0000
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] leds: max5970: fix unreleased fwnode_handle
 in probe function
Message-ID: <20241031161404.GJ10824@google.com>
References: <20241019-max5970-of_node_put-v1-0-e6ce4af4119b@gmail.com>
 <20241019-max5970-of_node_put-v1-1-e6ce4af4119b@gmail.com>
 <173039113720.1798167.5364741747242416515.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173039113720.1798167.5364741747242416515.b4-ty@kernel.org>

On Thu, 31 Oct 2024, Lee Jones wrote:

> On Sat, 19 Oct 2024 21:36:43 +0200, Javier Carrasco wrote:
> > An object initialized via device_get_named_child_node() requires calls
> > to fwnode_handle_put() when it is no longer required to avoid leaking
> > memory.
> > 
> > Add the missing calls to fwnode_handle_put() in the different paths
> > (error paths and normal exit).
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] leds: max5970: fix unreleased fwnode_handle in probe function
>       commit: 42c04062ba3cd1f2aef96dc160e0ab4b45b5e10a

Unapplied.

-- 
Lee Jones [李琼斯]

