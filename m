Return-Path: <linux-leds+bounces-3224-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E29B7FC2
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 17:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D927AB21763
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 16:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3549A1BBBD8;
	Thu, 31 Oct 2024 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlirAf+A"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6B91BBBCF;
	Thu, 31 Oct 2024 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730391279; cv=none; b=T3XIvdfIHoCfJbyJze8+RUQJOXLIq/PHuKSp2KHzdkdyvNWh6Ye7OdXBaSyVyduBVKWfBdqKSVlbfwxa2TzQBb5mpFv46rYVx5u9O5dXmNaKN3xxBth60TgTmuu/ZMFIrhr3eIjgUn7Vjx+/xS6iuLaHCzv3CglVVOx1+Pt4Q8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730391279; c=relaxed/simple;
	bh=R16jEihtij72jhU79U17+UGgLHWFyv+Fwd4ynu0ol6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBI8sr9PLn0Sd8wHBgOdCgsthvQML6u6o6nffVJKSU9IqkF4tURYzweDcdIuqtK5KqCo/5+nFqiO2Ksu90ZNZnQKRn1aj3RwsAIBHWwEF1yJBwywvY0LHUgR5cMKUdE5jrL6PjZEfYksCntA+A7yT8Wwy3p2EyfAriWtAULhzVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlirAf+A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4886FC4CEF8;
	Thu, 31 Oct 2024 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730391278;
	bh=R16jEihtij72jhU79U17+UGgLHWFyv+Fwd4ynu0ol6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlirAf+A2xp3PkD0iJVtXWAo2MUQSueqiZplctyc/s8vUAxLB9g9hTt74rw5zgJ1N
	 GOhxvsPME9NgGPirdihbdw+2F8UUSYouzLC9o6NHpAYJoLz1uvrwdbVuEyLjSjRD2o
	 CYdGGoZ3o/9PzahYcTG/2va6WrMawGVebsdHgfdjbJ2lUahuMkJEBh262l9GkVaP5f
	 RJxo/YuM6NOAggDcYLMUZhcjAsijn4e5reIFhSW1Pnb37wXY9Ad4Ezy6pipH7XAPwr
	 G/KuhtSNcopONIMmqrSYQk8gJCzBiREa9fSxmSrIuwsIclmY250CIs8c182zqWmU1T
	 WAVU7ywSPGtVA==
Date: Thu, 31 Oct 2024 16:14:34 +0000
From: Lee Jones <lee@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: max5970: use cleanup facility for
 fwnode_handle led_node
Message-ID: <20241031161434.GK10824@google.com>
References: <20241019-max5970-of_node_put-v1-0-e6ce4af4119b@gmail.com>
 <20241019-max5970-of_node_put-v1-2-e6ce4af4119b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241019-max5970-of_node_put-v1-2-e6ce4af4119b@gmail.com>

On Sat, 19 Oct 2024, Javier Carrasco wrote:

> Add the automatic cleanup facility for 'led_node' to simplify the code
> and make it more robust against new error paths where omitting a call to
> fwnode_handle_put() would leak memory.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/leds/leds-max5970.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

This makes patch 1 completely pointless.

Please squash them and resubmit.

-- 
Lee Jones [李琼斯]

