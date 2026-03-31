Return-Path: <linux-leds+bounces-7601-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAYYHrSky2kUJwYAu9opvQ
	(envelope-from <linux-leds+bounces-7601-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 12:40:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8D63682C8
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 12:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B2263129337
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 10:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C843EF0A8;
	Tue, 31 Mar 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJ9FIk/L"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B03C3B47D7;
	Tue, 31 Mar 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952983; cv=none; b=Ycs+G98JMirtATPacqPhcOOQ/sf/Af0UDYuXjaGo0+uw/6gZnTASNXC1RGunnHNRDTdNo6LSodEbLLxEvvPGfBcnW3HMDeiNak4en73fJUAPesViEyeT/NVtLWwHMUODU1eXMmx4ro83XE44PCjTbu9rZ+9XHQKYdJbrjoFQHaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952983; c=relaxed/simple;
	bh=Sb7+YT5MlZJy3yCTsyHBgr+LrhrODBwZbdlcoutQ1nw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tlswOLXW0gUdWs/6XS55Fz9AHspbunOcayOZtQ6yGxaAa0gJhjdPBU0VKGV+eXDL5sUCLRNkeHYbXgwMTq5dPs11Uit1Nx0jeUb4BIwLtABVzRejQ+I6qj9tzYCqzFqMR14iak7XgstowiD+QkVWvTtG4DubpNxxXcU2MgKk9yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJ9FIk/L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A1DC19423;
	Tue, 31 Mar 2026 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774952982;
	bh=Sb7+YT5MlZJy3yCTsyHBgr+LrhrODBwZbdlcoutQ1nw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vJ9FIk/Ll0EXNGBCluxgxPor0U2/hwdbzW2L893wEEKHUVwai7LIFwGuoPHKx/2Xk
	 tIUzLJFX3eGbHWTC17sI92TDNei63m2WFyCVchSA4wM18LgbbL4NO5YHMGHP3NcaUR
	 hS4HeQJ9sry3fcQBW8cky5JeF/ZF6Q1GS5P75y4ou9zjxQ3gPXn4w4dKE74zyasx0d
	 z2tmHSq5VLMfWJf3YGnK5kXmTpxorfM2Z+Y4GvYlrdjhGQEQOogS7Fn/mNXmDeeiZM
	 Dd28P/M9qNBOmIT2l5CL7Ss9icBNMu8Qp+wuReaKHX1sOQiwmxqxrIypiJz6gNJFpI
	 CzqyNanidwx3g==
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Moritz Fischer <mdf@kernel.org>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-fpga@vger.kernel.org, 
 driver-core@lists.linux.dev
In-Reply-To: <20260322-remove-device-find-by-of-node-v1-5-b72eb22a1215@gmail.com>
References: <20260322-remove-device-find-by-of-node-v1-5-b72eb22a1215@gmail.com>
Subject: Re: (subset) [PATCH 05/10] leds: led-class: switch to using
 class_find_device_by_fwnode()
Message-Id: <177495297689.3815589.6859873475520670878.b4-ty@b4>
Date: Tue, 31 Mar 2026 11:29:36 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7601-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F8D63682C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 22 Mar 2026 18:54:23 -0700, Dmitry Torokhov wrote:
> In preparation to class_find_device_by_of_node() going away switch to
> using class_find_device_by_fwnode().

Applied, thanks!

[05/10] leds: led-class: switch to using class_find_device_by_fwnode()
        commit: b6de441f8ce22e3ead3b858342fe5652598a3572

--
Lee Jones [李琼斯]


