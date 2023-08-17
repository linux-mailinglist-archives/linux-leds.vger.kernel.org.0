Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4282277FF4D
	for <lists+linux-leds@lfdr.de>; Thu, 17 Aug 2023 22:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244092AbjHQUvy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Aug 2023 16:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355121AbjHQUvw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2023 16:51:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF76C3AA3
        for <linux-leds@vger.kernel.org>; Thu, 17 Aug 2023 13:51:35 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4ff09632194so205850e87.2
        for <linux-leds@vger.kernel.org>; Thu, 17 Aug 2023 13:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692305494; x=1692910294;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74GlaUWpOuTA0MhN5VZiM4NKezqQZlM+zhhkyJSJmPM=;
        b=F577ohvCOpg72JvVGeJHsLkJkNGaO1PRrrhWEVwO5VgnlOkQEXg9OsH8goUePLb9J7
         lK0Qg8Vo8OZsEgY0ug1/Qz9tWN7WpSzaoAv4/X2r7rxBzKLb0zWQWj8AZ25+DNIG+84H
         JoVKKo3LuoYl+d5ZA6ToOrdc1/xmn6WTZTfH4gsQ/fzCtMtV6wZmJseXHpH/sf3AwH9C
         brO0D2dOin7ioxUwE9hfHRfjP9FKmMsX9vinwdXUMLl/HFKosGZZmU5AoSB10bKYD58D
         rFTIZ2BCsyOcQmFfjba6+ayYAUpdLdfpEnVGGNJuiwMf5a1Nd38vdJSMTeOOpE8dI2B8
         +9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692305494; x=1692910294;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74GlaUWpOuTA0MhN5VZiM4NKezqQZlM+zhhkyJSJmPM=;
        b=DwGBP9nlbTrkj9VDGsVHSSMxUL4b8MIIBKR+UafkibVOWTK2u+npKw1Xd0EyKb1n2t
         qg+yu6fubsAClgQbItvXnMeyCys5A022vQfJ/+p4CPN6P+OMeCWgX1K3NJvouEnczQxC
         nnq2H+CefOHUxe58jEL+0/9iYOqtWSS/KwsVLPtR7JedYKf0V3yRzWZFolkOCWB0cBr7
         FSD48Wzl5GzvURHZz2OYKtxIlssnJLfpjRNj14oLcEFfn7TNRsGsMgetfqDlJ86EVsbj
         X8JvEQXifYGylQHHUr/h6Nirr6b/LS+D/RMQR1wgyIxOMGkQA9NLehoMygpllm4xdn2q
         GBfQ==
X-Gm-Message-State: AOJu0Yy0/LDJqNbDZeVEUxZxI5iP0/5eYeieVDEjf8fekTYo4cxbL3jC
        HZFcc3iqeqHwQGUnspWLv1r91EfUNcnFloA1UGk=
X-Google-Smtp-Source: AGHT+IF6gZU3cPRYtFl/4G8ccc82OVpA90WlGzsHAQfz9fynGmrHSbJz/lfhrXX/exNTsKckyu14cWttzA1kXvDrik0=
X-Received: by 2002:a05:6512:2024:b0:4fe:17d6:af2b with SMTP id
 s4-20020a056512202400b004fe17d6af2bmr256883lfs.42.1692305493599; Thu, 17 Aug
 2023 13:51:33 -0700 (PDT)
MIME-Version: 1.0
Sender: zandaicvises9@gmail.com
Received: by 2002:a98:b603:0:b0:1ce:699b:639f with HTTP; Thu, 17 Aug 2023
 13:51:33 -0700 (PDT)
From:   pernille <pernilleerenbjerg164@gmail.com>
Date:   Thu, 17 Aug 2023 13:51:33 -0700
X-Google-Sender-Auth: 9Y9HsBIQPSDAgkYI2Y1n0SGvTIU
Message-ID: <CADgrzVuu-AdpoYv-ewwJreQw7jLtAnD1X1-bBZJ5P3i2CpmN5g@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

-- 
I've been trying to reach you, I have a business proposal for you contact me
