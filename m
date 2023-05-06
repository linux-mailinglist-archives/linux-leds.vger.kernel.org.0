Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05F36F9157
	for <lists+linux-leds@lfdr.de>; Sat,  6 May 2023 13:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbjEFLA0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 May 2023 07:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjEFLA0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 May 2023 07:00:26 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A9659D7
        for <linux-leds@vger.kernel.org>; Sat,  6 May 2023 04:00:25 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-50b383222f7so4112246a12.3
        for <linux-leds@vger.kernel.org>; Sat, 06 May 2023 04:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683370823; x=1685962823;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jTliqUkmhKiwNzwktrQ9SUvY0HMDiN7hYUlvaA9PWE=;
        b=enapkLbbhTBO9AJZzeiKG/djW75yasJ3J89fRLo8GEgjZkwVT3qZGOmTRT8baWF9L0
         XjYFbZGrmX2+gnQgwx+FPs2zjjrhLbTIqyL2ByhyFtHbU71UREGIX+YgY/JcWL4xTJIn
         /NawaiFm8nklDLURfOYCFnCPQJcu9ShNku9X6ZHX2b8YpcJqS0NQCvh2NvDDctfyAsdA
         +TlcQByCAqi0EaM9krDuOkDm7+sNg6QMROP9EN5Je6DgNdZVdidShKlhA2JYrzgcUWCn
         SZRdaTMCNZcPlltluYkjWDG69trT8Klmu0ToNV4J2es/3Mvvl08iSOScQyBKIZJLbSo/
         gzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683370823; x=1685962823;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jTliqUkmhKiwNzwktrQ9SUvY0HMDiN7hYUlvaA9PWE=;
        b=a20Tg/RX91mwfRRVkvsvSt6W3eXvHOWQngdWULX3gI0oh8rx7L/7QgVvMYK9CpKDB9
         Uh7VovU9KJwKTeATTAaRjmIGHVE5FjEJalKQvm5ZRpEGGmegEsKJVZDDcboP4M1CwEua
         utB37MWiTCYcYlKWpdX5HEg3d0zXipU8ao/6JYNy6tQgKJMsApy4clpymez571b1QqfK
         8EmYMGY1i+6mcXPWBH8QjDUdHRdyFF6yHHolhM1r2m2Ma6MUxbqDH5mRX7E4FKkSnKwD
         FzGej8znVfFcP1c5KTU4Be1ek15ZFZWKL2K+ONOHtPQaEKkHBUvYDne6YfX4jchJwDkY
         WUJw==
X-Gm-Message-State: AC+VfDwT1iyEisbH/fDlRrlONDLQL7m0DY2XhtxFQXymCko774tDtQMI
        s/4hI8RXiZwlObzkZRnWF+YRD8E/X5XsnIgwuW0=
X-Google-Smtp-Source: ACHHUZ7ugXWpz0wYD000wciGSwTtaEAmkaw2w6uG+p+mu4OvF/Bf9yGHFR29K5znTorWs2fomLAMCLMa0EtUuUyrslg=
X-Received: by 2002:a17:907:1c23:b0:966:2984:3da0 with SMTP id
 nc35-20020a1709071c2300b0096629843da0mr313810ejc.63.1683370823232; Sat, 06
 May 2023 04:00:23 -0700 (PDT)
MIME-Version: 1.0
Sender: muhammadfatimah2003@gmail.com
Received: by 2002:a05:6f02:122:b0:4a:b9be:1370 with HTTP; Sat, 6 May 2023
 04:00:20 -0700 (PDT)
From:   "Mrs. Margaret Christopher" <mrsmargaretchristopher001@gmail.com>
Date:   Sat, 6 May 2023 05:00:20 -0600
X-Google-Sender-Auth: 1UFGVkwM4jrwYjZms1a9_1Afpvw
Message-ID: <CAOkfcune26djrZvYDx4O6knSDiG2bkiMMy1BP309Gfgit1gdhw@mail.gmail.com>
Subject: Humanitarian Project For Less Privileged.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

-- 
Hello Dear

  Am a dying woman here in the hospital, i was diagnose as a
Coronavirus patient over 2 months ago. I am A business woman who is
dealing with Gold Exportation, I Am 59 year old from USA California i
have a charitable and unfufilling  project that am about to handover
to you, if you are interested to know more about this project please reply me.

 Hope to hear from you

Best Regard
