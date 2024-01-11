Return-Path: <linux-leds+bounces-579-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CCC82ABE0
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 11:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B8EEB2432B
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jan 2024 10:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B63714A86;
	Thu, 11 Jan 2024 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Twe+uQWa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1016C14A85
	for <linux-leds@vger.kernel.org>; Thu, 11 Jan 2024 10:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98177C433F1;
	Thu, 11 Jan 2024 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704968633;
	bh=swVrI6cc6pZnXdDnUB6s7Bym4Xev5sWOYg+nrX6RwM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Twe+uQWaLdHUcffqLpj6AldDxP7kmQieYV5Dy/t67MyK8SDI1kwT3x19DbiXoB5cO
	 0jIzv+lBxPBQSjPZk4/lpMylwIihjKnf9pZQkjIclr/2UV8m8feZZhJRTaJ6NCoUiU
	 7taokWrlr++vLr7TxU9TVDveW5w+qiJVkQjEpJfpbOw98DzllUH0AJzLRIPml5Lqss
	 Z1sLbzpDQ0BzZ/KRHGK0aVYW6uXTl9//0SxipzxLY+cjr2yPDRiab//k1Ny0TIxxcG
	 +tc147AQXTgD1aCNUdXPrZp5a2uKwnoiOu7u/RJkUinDg0vbttFXxw2zxMZk1mOOBO
	 y9sR+dNfOWkzA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <72c8b297-72a9-493e-a8fa-cc37ee460cf1@gmail.com>
References: <72c8b297-72a9-493e-a8fa-cc37ee460cf1@gmail.com>
Subject: Re: [PATCH 0/2] leds: trigger: load trigger modules on-demand if
 used as default trigger
Message-Id: <170496863235.1664766.12243746310465001495.b4-ty@kernel.org>
Date: Thu, 11 Jan 2024 10:23:52 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 21 Dec 2023 23:18:13 +0100, Heiner Kallweit wrote:
> Even if a trigger is set as default trigger for a LED device,
> the respective trigger module (if built as module) isn't automatically
> loaded by the kernel if the LED device is registered. I think we can
> do better. Try to load the module asynchronously by alias
> ledtrig:<trigger name>. This requires that such an alias is added to
> relevant triggers. At first do this for the netdev trigger.
> 
> [...]

Applied, thanks!

[1/2] leds: trigger: load trigger modules on-demand if used as default trigger
      commit: 5edf7f11313d99dc96d30b5d99b68e56d7c3d4e1
[2/2] leds: trigger: netdev: Add module alias ledtrig:netdev
      commit: defaca9f7cfb27681064e20f4aaa8dcf4dc09590

--
Lee Jones [李琼斯]


