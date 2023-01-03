Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70DE765BCEA
	for <lists+linux-leds@lfdr.de>; Tue,  3 Jan 2023 10:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbjACJRE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Jan 2023 04:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237079AbjACJQw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Jan 2023 04:16:52 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F976E00E
        for <linux-leds@vger.kernel.org>; Tue,  3 Jan 2023 01:16:51 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id z7so14428154pfq.13
        for <linux-leds@vger.kernel.org>; Tue, 03 Jan 2023 01:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bsv6sMQmC8jnqT/6rqRjPIfpOBvg88+WOYXR6wIOiQA=;
        b=L4QCsZXhT0TI4pII995xIoC8oBcApkNjMLwIlf8yMRg7zzO3FrzwFQvMLGolU5OrE/
         86c9067Rl5c/xwReGcY3Beux+Bxn710Ps6H3eQbBD4wSoLKvAjcEWyOe7rd9JIP9KhbH
         UDU7ailCRql3J4cwjVaNlpAB3iGFS03SeexT6hHm40q+ChO949CQhuS+6Lf/lcQjpMkR
         p2p84FbAzvkv6f842OaQbZ3AIAnFPStoLQmj8NBubn0gCPSqKKd68IIl5hYByZY01ciC
         YV6LJUVYuebaot6nsNgnybAbzO+cnPsw0f481H8ZWwMajHwB8kX5+K5gEVv2POyh+Xhb
         JL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bsv6sMQmC8jnqT/6rqRjPIfpOBvg88+WOYXR6wIOiQA=;
        b=paAwv+zi04AWlk20OA54g65FsvrO2qL2IKfPi8r1Sk0OG50kgKD1MhWkQAs3ibwVF4
         qUM6zek68px9Gc60Td2NK0Heww9mrFA0IU/LT4kXEtR1HY2CadiWEa14j8fiOBYxh5OB
         eUcGAnvIWXHuxe1oF419zoV2D0YkR0NiLKhSrDG527Ixe/o0oxgLpBu/X9GdZXaXM5sD
         DpO+hjYayniBukC2GXkJWqYoznItzdb7SzoxIZi5JtyQtypy53kvUqyhyTfAB52DiE80
         Zsg3UmI5u+yd1Qae0uVb0ulcegfnMrtS5ac4Ubdatf1GJ+NS1zsYfBJHTfFNO3Qhbg1A
         EYpg==
X-Gm-Message-State: AFqh2krmVnDypbzE5+z6XZ5pdk+TE+DNXKidjbO3zUpL94/08mEtada5
        SjhLHROUEoPPy2LwDuHPbOY5485d87GxbuKUXvg=
X-Google-Smtp-Source: AMrXdXs3E68GZbSTpVJkQcuR2Jiw3YB2ske2uQ6M2uucmDEpw0b2yOcpEVWmo4neMh8L+HEa4/sqK7BdvOzsdBx9h1s=
X-Received: by 2002:a63:3cc:0:b0:496:508d:6e43 with SMTP id
 195-20020a6303cc000000b00496508d6e43mr2590938pgd.245.1672737410584; Tue, 03
 Jan 2023 01:16:50 -0800 (PST)
MIME-Version: 1.0
Sender: lilaeric8@gmail.com
Received: by 2002:a05:6a10:4a14:b0:3a5:cad5:78d8 with HTTP; Tue, 3 Jan 2023
 01:16:49 -0800 (PST)
From:   Aisha Al-Gaddafi <aishaalgaddafi112@gmail.com>
Date:   Tue, 3 Jan 2023 10:16:49 +0100
X-Google-Sender-Auth: JQo9s1OrlFTB89OmOF8Xj9T6B4w
Message-ID: <CAPA+_mKV6+6bLCGxY390HRMmBwTD18-R8AynMdYm1fLiS3C9ZQ@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Dear,

I am sorry to encroach into your privacy in this manner, There is
absolutely going to be a great doubt and distrust in your heart in
respect of this email, coupled with the fact that so many individuals
have taken possession of the Internet to facilitate their nefarious
deeds, thereby making it extremely difficult for genuine and
legitimate business class persons to get attention and recognition.

I am seeking your assistance for the transfer of Twenty Seven Million
Five Hundred Thousand United State Dollars ($27.500.000.00 ) to your
account for private investment purpose.

I look forward to your response.
Mrs. Aisha Al-Gaddafi.
