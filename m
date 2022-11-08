Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA774620E93
	for <lists+linux-leds@lfdr.de>; Tue,  8 Nov 2022 12:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbiKHLU3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Nov 2022 06:20:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234090AbiKHLUS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Nov 2022 06:20:18 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600724876C
        for <linux-leds@vger.kernel.org>; Tue,  8 Nov 2022 03:20:17 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id r3so16995482yba.5
        for <linux-leds@vger.kernel.org>; Tue, 08 Nov 2022 03:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD/YBCtOhOa1ipEyheDVa6geA3XolzkSqDbroMLmTEw=;
        b=TaVZcPyhcwvIKT0DspQYPF3nABsR4h6/WYqtToRKSRCFTH8BMrS5G882LsPATtbyzV
         jzoE7h4dSUKPl3F10D6hGFtoxLxRO3JjGzimChEHHR37w8BiLh44apmVl5x0RvYhItpf
         oeGU7HxBUHUm1o36s9LWVhFUaykEEg9sc/Z7HU/wMzausH5yKTH9sezeXlPzn50MahG1
         ZIKcdUmXzCwpbikCF4LxO30nfdEjdBgReLkKHBJTOIhH6B8ANJBrYlVADnKmbQddY8t1
         mJ5tfk+3w20UwsLl4AI/3Ce+oFCq3FGgoFdM0ZHa7RUZenWCpqto8Or6dPJBWre0dfpP
         yzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jD/YBCtOhOa1ipEyheDVa6geA3XolzkSqDbroMLmTEw=;
        b=UJcI2p2I9WuUWKFKYF0YRrpqFsULTBgyKb5JOxlWeB/UiGf02dHCDQyFCVAygdsVE8
         PbXHrcGUpmszYEi925hDlVtJ0CbHYKaJmmf4gUMq1J0+sOpsng5cjs54VrkmL3ayLKp/
         aaqbuT7rz+FgrWFU0b/HhLv/1K0OBV3I30/IY/rFRH3VKKsEBR3Uu2EZoBbHvmnb31al
         YSw1wYvz5D12mXx5GxQrrcHm87eZfENtZFaZfaOSn0t3GxGlGH05kYqJVO/MMWmEG5zU
         76UC5WsXd15ZYmQ3L5mtzFef7G/+dTIGj06YcGdFv2Q36G5nS7OvtD4qIUn2NHiN2Dlm
         2t6Q==
X-Gm-Message-State: ACrzQf1Qrg63f2deO1x9fFfmbBx8O1j3ri4q7ZwWd8x4nv7DkEdHQliK
        ictSocbHOismDRrB0GV37/390FTwJdBcHTzV9ys=
X-Google-Smtp-Source: AMsMyM4b/VnhkUlWUIvpD6nfWhxjBvkRFiS4/EBA5Gb2bB1MsklPspBej0wnSrb7b6dGbERMKZFLhKx47dy1Q4tjdxI=
X-Received: by 2002:a25:9808:0:b0:6cc:127b:cad7 with SMTP id
 a8-20020a259808000000b006cc127bcad7mr51498130ybo.384.1667906416555; Tue, 08
 Nov 2022 03:20:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:a38a:b0:313:c983:1d7e with HTTP; Tue, 8 Nov 2022
 03:20:16 -0800 (PST)
Reply-To: mrinvest1010@gmail.com
From:   "K. A. Mr. Kairi" <ctocik2@gmail.com>
Date:   Tue, 8 Nov 2022 03:20:16 -0800
Message-ID: <CAC9COZdia0vBX33ov6ex2S9EP+TnWa=HZmEwSo=EgS7XLZW7CQ@mail.gmail.com>
Subject: Re: My Response..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b29 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrinvest1010[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ctocik2[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ctocik2[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

-- 
Hi

How are you with your family, I have a serious client, whom will be
interested to invest in your country, I got your Details through the
Investment Network and world Global Business directory.

If you are interested for more details.....

Sincerely,
Kairi Andrew
