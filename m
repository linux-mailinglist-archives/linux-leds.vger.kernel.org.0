Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE1859B0DE
	for <lists+linux-leds@lfdr.de>; Sun, 21 Aug 2022 01:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbiHTXEA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 20 Aug 2022 19:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233998AbiHTXD7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 20 Aug 2022 19:03:59 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A96011C23
        for <linux-leds@vger.kernel.org>; Sat, 20 Aug 2022 16:03:57 -0700 (PDT)
Date:   Sat, 20 Aug 2022 23:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1661036632; x=1661295832;
        bh=4QrKLjG/691LTgnZIjCG1hgDF2CR3GNb8eNP3hBH6YE=;
        h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
         Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=k8k3eeSb4UTtkPbZeNihkSJMnYzoiOioOB4uy3Xtj+m1KkUshKsfagL2EJJE1KGO8
         FDF3S7NHjaIXlsOHhSt++gkJ4zOsMmG+0nY2p7RDlPsq9SJr4OeZ10qyha7WPw7TSu
         9sIJoFzHJamB7FSm/qfOw6CaKrcW+2nQWCpZrZGqf2fiaoAtv3WmeWu2dxVzZMCj7y
         EhuajODt0EzlkiSh/sLA/1VgQ+uUOlbsDfiMO4mq9txAdxrzzCqJ+L9GxqHWo/bet7
         cdqEgz8LAOh+mTN6KU6p0/kj/aKay+cMb3CpQKg3pji/KwtXVJLnkkk0MV0/JlZRiE
         Xs/BtEkpeJQiQ==
To:     linux-leds@vger.kernel.org
From:   Joseph Strauss <jstrauss16@proton.me>
Reply-To: Joseph Strauss <jstrauss16@proton.me>
Subject: Implementing missing BlinkM LED features
Message-ID: <20220820230337.wp7gaxzzz4qi56eb@libretux>
Feedback-ID: 52406082:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_GREY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The BlinkM LED is a programmable full-color RGB LED with use cases includin=
g industrial design, hobbyist projects, automotive lighting, and wearables.=
 The device is programmable in that specific commands can be send over I2C,=
 including scripts, for more complicated lighting effects. The datasheet ca=
n be found here: https://static1.squarespace.com/static/5c155684f407b410055=
2994c/t/5c2d20ca0e2e7292108eadf8/1546461407535/BlinkM_datasheet.pdf

After glancing through the source code for the existing driver, leds-blinkm=
.c, I noticed a TODO for implementing several of the device's key features,=
 including setting the time adjust, fade speed, and writing and reading scr=
ipt lines. I would be happy to try implementing and contributing those feat=
ures, but I wanted to hear some of your thoughts on it before I get started=
 and if you think it would be worth everyone's time.

Best Regards,
Joe

