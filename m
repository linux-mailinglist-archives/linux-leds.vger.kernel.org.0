Return-Path: <linux-leds+bounces-115-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6B7F6258
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 16:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 505901C20A79
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 15:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3485133CE4;
	Thu, 23 Nov 2023 15:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBZCK6JD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1705E2E843
	for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 15:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CB3C433C8;
	Thu, 23 Nov 2023 15:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700752239;
	bh=GrCfOdky6KNJjNJ8E6fqLtWu4tum/bJIEaA+gGu5VLw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WBZCK6JDKty6AftLqkLykG1Umyj3B/rM3ito0gNW3a5LedbPUkkEwT0aBtWDQ27nh
	 loDcAF5kt/0aFE4ADmtkojEyRn8AN8et83fmoANl73lCL+EOaooqkPhta1TYh3LVz1
	 PKog3Q+I0x+WQhFPnWoHFo/2hd6tWoIL5umhlQUdr0s4AyEI22FB9eIqhR4oALSjs9
	 NgLDD6vV0N7nDqi1+xZ7OKyAYVFOYNWk45l+w0iv80iZYzY6YJFamh4xshT0lf4Toh
	 soPMM2Oc36GpPnatU+U6Xlf5DcOxVqvzw68yDKtOYdebiIdo1xoMBM5dfIzGMikkWY
	 kat5oSK0qcRdg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Andrew Davis <afd@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231116224121.302150-1-afd@ti.com>
References: <20231116224121.302150-1-afd@ti.com>
Subject: Re: [PATCH 1/2] leds: tca6507: Use devm_gpiochip_add_data() to
 simplify remove path
Message-Id: <170075223827.1377245.12365647707765746523.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 15:10:38 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 16 Nov 2023 16:41:20 -0600, Andrew Davis wrote:
> Use devm version of gpiochip add function to handle removal for us.
> 
> 

Applied, thanks!

[1/2] leds: tca6507: Use devm_gpiochip_add_data() to simplify remove path
      commit: 50b683a8b9884f032c3d268b8a68df799219e91b
[2/2] leds: tca6507: Use devm_led_classdev_register() to simplify remove path
      commit: 612af3a44921f21c361a369899fec61698aa08e1

--
Lee Jones [李琼斯]


