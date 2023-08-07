Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D952A772710
	for <lists+linux-leds@lfdr.de>; Mon,  7 Aug 2023 16:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjHGOIw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Aug 2023 10:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjHGOIv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Aug 2023 10:08:51 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C016F3
        for <linux-leds@vger.kernel.org>; Mon,  7 Aug 2023 07:08:50 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bc34b32785so28993565ad.3
        for <linux-leds@vger.kernel.org>; Mon, 07 Aug 2023 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691417329; x=1692022129;
        h=reply-to:date:to:subject:content-description
         :content-transfer-encoding:mime-version:from:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeJMC8uQd6uF4qr+WdPwE3eIC4QtXm265LEcDc12V2I=;
        b=JhkyP5eL66t+SBxz0Vh5Z5iTwF5X2f1vMlB5XIcSWYxwSB352dNzLKuMfM1pY8q/E6
         v3vNVp/sRfSnL/316O+SbArJ6G01G1i8N5bpPJHSBgLhgMTk3ulh8u7ousFKj6F327oC
         Rz109quaTDnE6vBkNClT4rrAfJ5SsRC/nkyk2/D4b/6WuhjIdZ8ueRSQAyfedU+n49Iw
         uUVSD4O/gtmHnYP8rZLvffCHYv6hf+c+L+DReOVv7kgd9jwDGF3on3+YK0XmBmsCZip0
         F0ycjYiXP7/yWTdpJYcSNb5PWo8DxqXNAKXO9Er4Ufp8mg8HtuwwA+V16FVtCII1T8Fr
         cYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691417329; x=1692022129;
        h=reply-to:date:to:subject:content-description
         :content-transfer-encoding:mime-version:from:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qeJMC8uQd6uF4qr+WdPwE3eIC4QtXm265LEcDc12V2I=;
        b=h1YTb7CdcNO0/N0Ylh8W7Kgtv7PBiC4enqUATvfgzF2tBqixdgFusqerMVDhMGEoiR
         WBLGt1fR0wXrwI/A92+j6F3vE/NJt9egtePXbv7gzV1ChLHtavD/QVa15P9A6zCw4uwL
         qLNh4tI2sLA03UOsRxLcXu6ICStISWPYM9FDmm1iKrACon5eIRqHyaVgjMs9zcSM5S5G
         enpvpZa1geqlxlBoHbzcgKGuwVDR8zjjkp/BeDuGIgSqncOkfzXmJrkrmH4KouJb1F6V
         kgUuYfzzEAElisqKSRj85g/3wdNXR8SN0IMBD4g1zsuUYVl0j4UGe1Zv7yCZJZobNGhS
         9f7w==
X-Gm-Message-State: AOJu0Yxaf0aa+1CzaKEuenVPLsfsB4/XBQ7MtPWMtpKwLcNyYeQY3hET
        lKXAZjN0hW2bd8lr68hsxrgGas7lApLvHRuf
X-Google-Smtp-Source: AGHT+IHcq8FrAyjiozJDdypve4ClLbIOssaL7Aodpu1wwSM4VCFGCHXV8n0hP7oLn8wq4C3Ye/QgMA==
X-Received: by 2002:a17:903:1209:b0:1b6:b445:36d4 with SMTP id l9-20020a170903120900b001b6b44536d4mr8704801plh.43.1691417329445;
        Mon, 07 Aug 2023 07:08:49 -0700 (PDT)
Received: from [192.168.1.102] ([192.166.244.71])
        by smtp.gmail.com with ESMTPSA id jk21-20020a170903331500b001bbfa86ca3bsm7002018plb.78.2023.08.07.07.08.47
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Aug 2023 07:08:49 -0700 (PDT)
Message-ID: <64d0faf1.170a0220.94af6.c297@mx.google.com>
From:   World Health Organization Empowerment Group <rakesround@gmail.com>
X-Google-Original-From: World Health Organization Empowerment Group
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: We have a Job opportunity for you in your country;
To:     Recipients <World@vger.kernel.org>
Date:   Mon, 07 Aug 2023 21:08:31 +0700
Reply-To: drjeromewalcott@gmail.com
X-Spam-Status: No, score=1.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,TO_MALFORMED,
        T_FILL_THIS_FORM_SHORT autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Greetings! Sir /Madam.
                   =

We are writing this email to you from (World Health Organization Empowermen=
t Group) to inform you that we have a Job opportunity for you in your count=
ry, if you receive this message, send your CV or your information, Your Ful=
l Name, Your Address, Your Occupation, to (Dr.Jerome) via this email addres=
s: drjeromewalcott@gmail.com  For more information about the Job. The Job c=
annot stop your business or the work you are doing already. =


We know that this Message may come as a surprise to you.

Best Regards
Dr.Jerome Walcott
Office Email:drjeromewalcott@gmail.com
Office  WhatsApp Number: +447405575102. =

Office Contact Number: +1-7712204594
