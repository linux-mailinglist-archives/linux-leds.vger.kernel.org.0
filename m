Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F34220D96
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 15:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731369AbgGONDA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 09:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731364AbgGONDA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jul 2020 09:03:00 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2454FC061755;
        Wed, 15 Jul 2020 06:03:00 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id A601C140A4B;
        Wed, 15 Jul 2020 15:02:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594818178; bh=wjt5p2zs/BnNQixR8Q9OjRdubRO7Uu6w39hVviPSDQ0=;
        h=Date:From:To;
        b=NquQ2NJfx/R8NhcUxaAbiFW47DSIqVUnQJI29WvfUjMlKrWLQUbfMqjHsaNKVfXrS
         m13BhINpvMTpPFbE0tNk640UD374bHnE9MenZowwxP7RvzGb+TBNSg4HaK+ljPBo0K
         InbUzzMix8d8MVmz5tuQEF8OZEpUXvUUOH+/20nk=
Date:   Wed, 15 Jul 2020 15:02:58 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200715150258.11f247d6@dellmb.labs.office.nic.cz>
In-Reply-To: <c1bfdb2a-f11e-9f67-1569-10c48f40407c@ti.com>
References: <20200715124034.9804-1-marek.behun@nic.cz>
        <20200715124034.9804-2-marek.behun@nic.cz>
        <c1bfdb2a-f11e-9f67-1569-10c48f40407c@ti.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 15 Jul 2020 07:47:28 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> This is a bit confusing and reads very rough can maybe
> 
> There are 12 RGB LEDs that are controlled via a micro controller that 
> communicates via the I2C bus.
> 
> Dan
> 
> 

How about this?

  This module adds support for the RGB LEDs found on the front panel of
  the Turris Omnia router. There are 12 RGB LEDs that are controlled by
  a microcontroller that communicates via the I2C bus. Each LED is
  described as a subnode of this I2C device.
