Return-Path: <linux-leds+bounces-1730-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C088D5FBE
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E7141F2489B
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 10:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2271DD27E;
	Fri, 31 May 2024 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THt7O/fg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F287318756A
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717151448; cv=none; b=WNk5lxTQcudGpY3O2ACe/fUJ39uso8xW1eUlj0RRYbL09sVF4B5l+32DBrp8gcvOJfGoDFFAWW4b5ITQ8TrXU/lAV2xnQ1lOfUUwfKUAcUwfWPWzZMDxezaasLeVmiX0fRnm2Nqi3UXVqt5VEeeXTyQvDpfxbjN+VOvyAIKekYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717151448; c=relaxed/simple;
	bh=y4RwomX3kzRloga8QC5PJ4v3yoQ639DAT9wot0gSt1Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TYcsK6HWpCyDYHtDHJlMYffN/jsqJoIs29lw/DAGO0Cc80BPL7wWYdOd7aj3SVxo+pP7bSS2UuXVOPnVW3YOj996H/mYXBWY+yjNRVwHtfj7KMVyybAMP8Rf5//RDeUuYqs99AEmco+5LlggqZKfe2T64tbS732Kc7phy4xZNHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THt7O/fg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A113BC116B1;
	Fri, 31 May 2024 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717151447;
	bh=y4RwomX3kzRloga8QC5PJ4v3yoQ639DAT9wot0gSt1Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=THt7O/fgPaa42P8VtmH9VwDYPEjfJ+0UKVykEZXD79Ie8MJn2AQ53juDTYeT9hbQL
	 3KraO+AW1j4NDOx//FhvF5rYyJZr/AFeIbgeMBOaNUVCzq9mX8favPo/2FIs9ro7rR
	 9i8liC+PYXJktSytU3YT4OFgVRQhOr40kqE0qfHF08DMQNMwrndtB0V04KVv6G5qNz
	 MaX90eOcG4gJbop6/s2ZalJhxSZiXCCXWCUXZMl3JgK50eP+/2SRv4b/UALbWqwyjN
	 cjVWXq8lkZk1ILcJ1Q4yVX5RArB5A2wOr6jI1O8KXEdzphdb15ymS++5tlBQsn1kk3
	 z6PnzLlQTqmRg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: linux-leds@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240504162533.76780-1-hdegoede@redhat.com>
References: <20240504162533.76780-1-hdegoede@redhat.com>
Subject: Re: (subset) [PATCH] leds: trigger: Unregister sysfs attributes
 before calling deactivate()
Message-Id: <171715144637.1022718.8065729710570029408.b4-ty@kernel.org>
Date: Fri, 31 May 2024 11:30:46 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Sat, 04 May 2024 18:25:33 +0200, Hans de Goede wrote:
> Triggers which have trigger specific sysfs attributes typically store
> related data in trigger-data allocated by the activate() callback and
> freed by the deactivate() callback.
> 
> Calling device_remove_groups() after calling deactivate() leaves a window
> where the sysfs attributes show/store functions could be called after
> deactivation and then operate on the just freed trigger-data.
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: Unregister sysfs attributes before calling deactivate()
      commit: 1a71c0768c716f6aecc633246b55e7f4cf9c6c82

--
Lee Jones [李琼斯]


