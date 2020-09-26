Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF744279A46
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 17:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbgIZPFH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 11:05:07 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:56740 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIZPFH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 26 Sep 2020 11:05:07 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kMBl0-00GHim-1i; Sat, 26 Sep 2020 17:05:02 +0200
Date:   Sat, 26 Sep 2020 17:05:02 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v2 7/7] arm64: dts: marvell: Add a device tree for the
 iEi Puzzle-M801 board
Message-ID: <20200926150502.GE3850848@lunn.ch>
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
 <20200926135514.26189-8-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926135514.26189-8-luka.kovacic@sartura.hr>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 26, 2020 at 03:55:14PM +0200, Luka Kovacic wrote:
> Add initial support for the iEi Puzzle-M801 1U Rackmount Network
> Appliance board.
> 
> The board is based on the quad-core Marvell Armada 8040 SoC and supports
> up to 16 GB of DDR4 2400 MHz ECC RAM. It has a PCIe x16 slot (x2 lanes
> only) and an M.2 type B slot.
> 
> Main system hardware:
> 2x USB 3.0
> 4x Gigabit Ethernet
> 2x SFP+
> 1x SATA 3.0
> 1x M.2 type B
> 1x RJ45 UART
> 1x SPI flash
> 1x iEi WT61P803 PUZZLE Microcontroller
> 1x EPSON RX8010 RTC (used instead of the integrated Marvell RTC controller)
> 6x SFP+ LED
> 1x HDD LED
> 
> All of the hardware listed above is supported and tested in this port.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>

I don't know this Marvell SoC too well, but what i see looks O.K.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

To get this merged, you probably need to break this patchset up and
send the DT part to Gregory. It could be Lee will take the rest if
there are ACKed by from the LED and HWMON maintainer.

    Andrew
