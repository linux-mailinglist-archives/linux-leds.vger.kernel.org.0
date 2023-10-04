Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 125B97B8705
	for <lists+linux-leds@lfdr.de>; Wed,  4 Oct 2023 19:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbjJDRzb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Oct 2023 13:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233149AbjJDRzb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Oct 2023 13:55:31 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB5C9E
        for <linux-leds@vger.kernel.org>; Wed,  4 Oct 2023 10:55:27 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a2379a8b69so378147b3.2
        for <linux-leds@vger.kernel.org>; Wed, 04 Oct 2023 10:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696442127; x=1697046927; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bnEXt+Qpk/tuxhrYR1+7U0sSFNdLmUkU/mz7OnvQGzI=;
        b=Yek0mUvkp3DK4/ceC+k+sL1BH782I0NAkHEyKCpy8bjCYlXRjpWV29dbUBuRv4FjLR
         XJwQ7kkKnZUINHW54sk6YgOVEPvv/eJqv/j4HH+3UUixR+YWG/OLLp0HM3mk87FOxYOR
         iwxKY6a2J8eckHXw00RsFz7jHvN78bbHiP1BF33sVv69MF7kp7+xcONu3uWVNTFEZkOj
         5VC/LeHnY4Q/dTVQ1mUuhfZkxhPHUVseQxjBqF0gosi99JslwzkBrkfdsPkWsTM4XyzX
         TyAj3eoFULx2MLBz7XZjsCSAYPhscwwOvOBNsOVFGfjAfVztDSmwH/GH6M7mrm7bmtiM
         nQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696442127; x=1697046927;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bnEXt+Qpk/tuxhrYR1+7U0sSFNdLmUkU/mz7OnvQGzI=;
        b=Af2KW/IdDpzahvnPbwBridKXWukp7b7siF4hjVYMEH1X0bk0r5lulORfIOVHTxnAtK
         5Ik/kVQ6n0j89ajTlNp69pSzx/2iecwO8/jDkbGhzkRz+x/C0NYJcHuGaAO+rEn222wb
         49IHuI5aRUi2zmLt30Y1L4pSu2jyu9eY+WaJ9Or8EDwVLflx/D47SQK4YQJ1dGKZ6QX0
         O6g70sHOcoomClfuS1X9NpWk/pVJjCoiShqTd+UBoQ4isJVGV40REiqEVdOVjH/3smx5
         UcFkE33iZu+0EMnm/y6Smc6gHDy8EC1WsLRiSDuFaZXecTrCzcqUX6XyzDlBUn/fF8HZ
         o9rw==
X-Gm-Message-State: AOJu0YyXnH8aLCpzHK6QoQ+5BGyIGnyPek7tIJmJi0mF9SLOH9fdKn3L
        dxHprPH8YLvnNRfVEvwn5l19zBe75RHbDroBElrNG1geoTmCzylG7am7TF/U
X-Google-Smtp-Source: AGHT+IEmeDf4KlTLH33p95IkrEMknvNVGQa47kajohUwjSfE88QUNxNQhGBK03Q4w9IGMiUCUrSxIDzl79jKONau99g=
X-Received: by 2002:a0d:cad2:0:b0:59b:f744:f158 with SMTP id
 m201-20020a0dcad2000000b0059bf744f158mr3413679ywd.15.1696442126673; Wed, 04
 Oct 2023 10:55:26 -0700 (PDT)
MIME-Version: 1.0
From:   Jack Chen <zenghuchen@google.com>
Date:   Wed, 4 Oct 2023 13:55:14 -0400
Message-ID: <CALvyBcVfLZmW4Ks+hzWLMZCvzk1cCt=AV=2Dq9asiZJAv7iAPA@mail.gmail.com>
Subject: Proposal to add one "configured" property to indicate whether LED has
 been configured
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, Milo.Kim@ti.com,
        Anton Markov <amarkov@google.com>,
        Jesus Sanchez-Palencia <jesussanp@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,
When using a LED driver (leds-lp5562.c), we think of one potential
change to the Linux LED subsystem:
LED in Linux Kernel did not assume it could be configured before
Kernel, bootloader specifically. But, from a product perspective,
users expect to get feedback as soon as possible. So it is quite
possible that product developers have configured and turned on the LED
in bootloader to indicate sign of life. However, LED drivers just
re-initialize LED controllers (hardware) and LED would be off
afterwards, until it was turned on again by commands from user-space.
So we are thinking of adding one property "configured" to tell if the
LED was configured before. If so, drivers would not re-configure the
LED controller and could read some key information (brightness,
current etc) from the LED controller.
1) This property can be optional. If linux led thinks the change is
acceptable, we can upstream the changes to leds-lp5562.c (we can
slowly change other led drivers whenever they encounter the same
issue.)
2) If this proposal is not considered beneficial to the Linux LED
subsystem, can we add it only to leds-lp5562.c and upstream the
change?
Thanks
Jack Chen
