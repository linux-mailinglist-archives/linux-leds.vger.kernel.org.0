Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E03F1129CD
	for <lists+linux-leds@lfdr.de>; Wed,  4 Dec 2019 12:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfLDLCc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Dec 2019 06:02:32 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:36490 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbfLDLCc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Dec 2019 06:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=FERLaxZUxyP72Jvm9tSRCjsYA68i6+0dGt84HtQCKYc=; b=tMB/Rov2jut9SYIQWR2KinbOy
        2s5FbXddNAOcEZDNnZVJ7bQT/Sw0ZiWWjZWYNQbzFU0vbKRWpK0Q3OSrXeBB3qT9iDHo4GUPuUOpd
        F6ELFzYkyoSgGBU2Xs6cBoRmoDMf0Rhw9ZBHu/vy9Bn6v6vk8ROEkVG4onNAgsDkUavi0NHKIxxG9
        THZJyCJFm7qwYomcwmaljlnhkGVr2q5A2e3dRrGVg9ECbA/xEMJiHWyiRpLF1dM00C+r5QcpSGCw5
        MvcytmyZkk6Eiot+0r2BrqsFEpwqG879jioPn6cOdkDQOgMSCFzbyCb3Tih0knyn6Sta54+xn4a3w
        O+r3gliXg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48382)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1icSQI-00049b-HR; Wed, 04 Dec 2019 11:02:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1icSQF-00071j-NR; Wed, 04 Dec 2019 11:02:19 +0000
Date:   Wed, 4 Dec 2019 11:02:19 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: "leds: gpio: Use generic support for composing LED names" breaks
 gpio debugfs
Message-ID: <20191204110219.GV25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

Patch d7235f5feaa0 ("leds: gpio: Use generic support for composing LED
names") changed the way labels are used.

devm_fwnode_get_gpiod_from_child() is passed led.name, which used to be
set to the label or node name, resulting in /sys/kernel/debug/gpio
containing useful information.  For example:

 gpio-487 (                    |udpu:green:power    ) out lo
 gpio-488 (                    |udpu:red:power      ) out hi
 gpio-489 (                    |udpu:green:network  ) out hi
 gpio-490 (                    |udpu:red:network    ) out hi
 gpio-491 (                    |udpu:green:alarm    ) out hi
 gpio-492 (                    |udpu:red:alarm      ) out hi

After this commit, it now contains a rather less useful:

 gpio-487 (                    |?                   ) out hi ACTIVE LOW
 gpio-488 (                    |?                   ) out hi ACTIVE LOW
 gpio-489 (                    |?                   ) out hi ACTIVE LOW
 gpio-490 (                    |?                   ) out hi ACTIVE LOW
 gpio-491 (                    |?                   ) out hi ACTIVE LOW
 gpio-492 (                    |?                   ) out hi ACTIVE LOW

This is because led.name is now NULL prior to the call to
devm_fwnode_get_gpiod_from_child().

While this is not an API, it is useful for debugging, and given the
dynamic allocation of GPIOs to physical GPIOs, having the labels
present is an advantage.

Can this be fixed / old behaviour restored?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
