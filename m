Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F00E31C4A1
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 01:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhBPAeX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Feb 2021 19:34:23 -0500
Received: from mail.nic.cz ([217.31.204.67]:40778 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229670AbhBPAeV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 15 Feb 2021 19:34:21 -0500
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id B3BF1140AE7;
        Tue, 16 Feb 2021 01:33:38 +0100 (CET)
Date:   Tue, 16 Feb 2021 01:33:37 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v6 3/4] HID: playstation: add DualSense player LEDs
 support.
Message-ID: <20210216013337.284220cf@nic.cz>
In-Reply-To: <CANndSK=52kV50SsDzhEg78m67AFhNoz=Z4H1=pFyHLzAJj-YBQ@mail.gmail.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
        <20210215004549.135251-4-roderick@gaikai.com>
        <CANndSK=52kV50SsDzhEg78m67AFhNoz=Z4H1=pFyHLzAJj-YBQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 15 Feb 2021 15:00:30 -0800
Roderick Colenbrander <roderick@gaikai.com> wrote:

> What is the desired naming for these player LEDs? There is not an
> officially designed function based on DT bindings. So far they used
> "playstation::mac::ledX". When changing the naming scheme towards
> "hid" and removing MAC, they would be: "hid%d::led1" etcetera.

Hi,

there is one more thing I forgot to mention in the LED name schema:
  devicename:color:function-functionEnumerator

So LED core can for example compose a names in the format:
  switch0:green:lan-1
  switch0:green:lan-2
  switch0:green:lan-3
  switch0:green:lan-4

In your case I think the most appropriate name would be something like
  hid0:color:indicator-1
  hid0:color:indicator-2
  ...

Are these LEDs of different colors which are impossible to determine?
The string "hid%d::led1" you mention above does not indicate color.

Marek
