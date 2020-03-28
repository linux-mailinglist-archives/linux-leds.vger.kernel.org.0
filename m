Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94C7119661F
	for <lists+linux-leds@lfdr.de>; Sat, 28 Mar 2020 13:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgC1Mgc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 28 Mar 2020 08:36:32 -0400
Received: from lists.nic.cz ([217.31.204.67]:55074 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726225AbgC1Mgc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 28 Mar 2020 08:36:32 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 38FFD140AC6;
        Sat, 28 Mar 2020 13:36:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1585398990; bh=DhToRBExHsapsRBfX/fjaElVWeMHYssOGau4QFrlBJQ=;
        h=Date:From:To;
        b=OptxID5Nr43Pz6xwVxItyDoE1lFNd6KBb1jhQV6Ii8il2RIWIKNGDj57JQhjRHfoZ
         efc7nRERIF/GM/gZqv/eae5IGb6kfmZErIEy7E2l9kiBOH2NiZFGdhl/iyoHf0OEOT
         beXef+90h53cd1DAUiku8KzIVyhJNGxwrBFjZDY0=
Date:   Sat, 28 Mar 2020 13:36:29 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia
 LEDs
Message-ID: <20200328133629.79603fe3@nic.cz>
In-Reply-To: <20200328132729.5e628fe6@nic.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
        <20200321153325.GD8386@duo.ucw.cz>
        <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
        <20200328132729.5e628fe6@nic.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> This was only RFC, please do not merge.

Jacek, Pavel,

I decided to abandon the microcontroller driver path.
But nonetheless there is still one thing I would like to solve.

The front button on Omnia is used to control the global brightness of
the RGB LEDs, so that user can change it if the LEDs glow too much.
The microcontroller does this as such: there is another PWM on top of
all the LED PWMs, and this value can be manipulated via the same i2c
interface as the LEDs, but via another command.

The thing is that I would like to somehow export this global brightness
setting to userspace, because otherwise it gets reset after reboot, and
I want the user to be able to set this global brightness by software,
so that they won't have to change it after every reboot manually by
pressing the front button.

I am wondering how to do this. Last year I proposed this by adding a
sysfs attribute file to the device which is parent to the LEDs, but you
did not agree :(

Marek
