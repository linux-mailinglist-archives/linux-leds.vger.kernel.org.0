Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB9624EA9D
	for <lists+linux-leds@lfdr.de>; Sun, 23 Aug 2020 02:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgHWAwO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 22 Aug 2020 20:52:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:54844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgHWAwO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 22 Aug 2020 20:52:14 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 402412072D;
        Sun, 23 Aug 2020 00:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598143933;
        bh=fHKSK8wdF749P2iqH1it2zMw2LMD18Kh7O1CA/kPKLs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GX0WngMrj73Isxo8BzajuGY1NeGUDH9y8qqQwbwcTPgDOviruOgCM4LWLXCkdIwMz
         ygUj0VsFy8mmtC07WgEXEMyXpETytdYKFwRKh/3t7Y+steYARJH2Lvnt16af9IA+ES
         Z/IpqGR5TLfnpCiI3zzSZImi0PegfYLDSAIzF1mU=
Date:   Sun, 23 Aug 2020 08:52:07 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh@kernel.org,
        marek.behun@nic.cz, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v33 5/6] ARM: dts: imx6dl-yapp4: Add reg property to the
 lp5562 channel node
Message-ID: <20200823005206.GD30094@dragon>
References: <20200812195020.13568-1-dmurphy@ti.com>
 <20200812195020.13568-6-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812195020.13568-6-dmurphy@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Aug 12, 2020 at 02:50:19PM -0500, Dan Murphy wrote:
> Add the reg property to each channel node.  This update is
> to accommodate the multicolor framework.  In addition to the
> accommodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Shawn Guo <shawnguo@kernel.org>
> CC: Sascha Hauer <s.hauer@pengutronix.de>
> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> CC: Fabio Estevam <festevam@gmail.com>
> CC: NXP Linux Team <linux-imx@nxp.com>

Applied, thanks.
