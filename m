Return-Path: <linux-leds+bounces-251-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6FA8041D4
	for <lists+linux-leds@lfdr.de>; Mon,  4 Dec 2023 23:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39FAF1C20998
	for <lists+linux-leds@lfdr.de>; Mon,  4 Dec 2023 22:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0F41D6A1;
	Mon,  4 Dec 2023 22:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohVWi/8J"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C22612B65;
	Mon,  4 Dec 2023 22:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7725C433C7;
	Mon,  4 Dec 2023 22:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701730090;
	bh=s5UMjroUUBnqrkudHzco0XvVV7T0zY9vxTEuPjUSfMQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ohVWi/8JQ9k694eSP7Th0NXcQPkRY+xLqI5SRXZjjHlhk/sRy7/qso5HXxlcENXeN
	 Tnx7JyJxb99z5KONIwWdkePEqxs/2ogL9LO4X4rkI4QKF5uyF9lcL2RDmG4iu+mu30
	 3rkvVWiNhaaCWY9n3/ubV8G6yrH2WNyyZyZqF3RIWfYV+V29QdhjHTPiI0ynyXpXtI
	 OtQlqFw41eUL/xnRIBbg+wi486J+OQRnzPWM/NAFr/aK67qWOrm8o0E88HLCHWSTox
	 k6wmACdpciftdXNUQfUmN9/Al6TWSitDuyCrT9dzpo2Yo9aK7tu4iEOGPdLDK7BT1E
	 RbXxd5vBSFhVQ==
Date: Mon, 4 Dec 2023 14:48:08 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Christian Marangi
 <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Simon Horman
 <horms@kernel.org>
Subject: Re: [PATCH v2] leds: trigger: netdev: fix RTNL handling to prevent
 potential deadlock
Message-ID: <20231204144808.26083e8a@kernel.org>
In-Reply-To: <fb5c8294-2a10-4bf5-8f10-3d2b77d2757e@gmail.com>
References: <fb5c8294-2a10-4bf5-8f10-3d2b77d2757e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 1 Dec 2023 11:23:22 +0100 Heiner Kallweit wrote:
> When working on LED support for r8169 I got the following lockdep
> warning. Easiest way to prevent this scenario seems to be to take
> the RTNL lock before the trigger_data lock in set_device_name().

Pavel/Lee, would you like to handle this patch?
Or should we ship it to Linus on Thu?

