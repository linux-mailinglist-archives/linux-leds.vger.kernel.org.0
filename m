Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5159A262254
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 00:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbgIHWDM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Sep 2020 18:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgIHWDM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Sep 2020 18:03:12 -0400
X-Greylist: delayed 79203 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Sep 2020 15:03:11 PDT
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F5AC061573;
        Tue,  8 Sep 2020 15:03:11 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id E27F7140BBD;
        Wed,  9 Sep 2020 00:03:05 +0200 (CEST)
Date:   Wed, 9 Sep 2020 00:03:05 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     netdev@vger.kernel.org
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH net-next v1 1/3] dt-bindings: net: ethernet-phy: add
 description for PHY LEDs
Message-ID: <20200909000305.69cdfdd6@nic.cz>
In-Reply-To: <20200908000300.6982-2-marek.behun@nic.cz>
References: <20200908000300.6982-1-marek.behun@nic.cz>
        <20200908000300.6982-2-marek.behun@nic.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Please ignore this series, still refactoring...
