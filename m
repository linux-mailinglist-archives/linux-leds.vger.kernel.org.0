Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 348AD269CE
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 20:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbfEVS1i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 14:27:38 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34253 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbfEVS1i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 14:27:38 -0400
Received: by mail-lj1-f196.google.com with SMTP id j24so3037692ljg.1;
        Wed, 22 May 2019 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xU0+H+L47el2KL8nstCLThsW4uph4L0CsVSGviTKcu8=;
        b=sqjSc+JZO+eH9eldXTc/1xpxoJXpSqFYNk+Vr+PaFkjIT/uNrEY9714QmsGFNrfdxu
         qwVRMVAa2I+s19UdT3EnqFczfOld0RJfSCYwP5O+iyYTUmljX6jX1hon8q4uQSCRs7Az
         Pvcpub0XTDjYYH12ygu47Lt55yv4Ihc5N8oTc5O4Fggp1VNjbz0BfPV2EXMDm4nte02u
         LOh6u79NSqs4V1Uo6H99SGpsZmMU1Et1YghbG4OgbN19EWH5HLAXJinYXmPabvweoUDF
         oVdDOKoibMN2vKTbRcwOzCYwyEHU/7bMzB1f/2karKtXpse3dUPiM7hjKNnKjt2h42OP
         7kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xU0+H+L47el2KL8nstCLThsW4uph4L0CsVSGviTKcu8=;
        b=DbMk1BGcmEBKf/VVU2uA1sYtiz6/8zwj7PbIWPYLHnx0PjOfrb1MdSMFh4zutQau1M
         X/fwcQcHwJkmFnCK0NMtxuLLedNnXC6lf0FTVWiTatxFomFwqHhxT4qlTU9AM4XSQsdZ
         iiuHUtgec8wishoi6j4YDE1Ao9si63rH0d4pGCVPzgaV7IgIOJv8ZFaVKfm+HeE8dAFF
         2SHs978xEztSuqYSCLt5HnLdiN6vlQe8I/bXrC0uqc3WT23xYX2NKZ8WHsErIzxl+VS7
         BJjrNeD085DCl3y4p3tmikevui1F3XgII+Iy4Ean0Ihu0+twOxvmRc/GQCxHqlaZBBc6
         w52A==
X-Gm-Message-State: APjAAAWIw0wKBjNA/oqZFrIZIy+WmhSC6yAMm+fpcmqPkWtc60SBgKIV
        ZVvAXVESHLvc8VRqJLvgEZU=
X-Google-Smtp-Source: APXvYqw5wv/o9g+YlL0coT5LaHe/xJ9ZbDxW5C20Ue5dQcqyh6RZtUtJazhlz0iHFb4tVbBheeaGCQ==
X-Received: by 2002:a2e:89cb:: with SMTP id c11mr13335494ljk.16.1558549655595;
        Wed, 22 May 2019 11:27:35 -0700 (PDT)
Received: from [192.168.1.17] (dma4.neoplus.adsl.tpnet.pl. [83.24.56.4])
        by smtp.gmail.com with ESMTPSA id f8sm3663332lfc.72.2019.05.22.11.27.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 11:27:35 -0700 (PDT)
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        lee.jones@linaro.org, lgirdwood@gmail.com
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190521211504.GD1580@sirena.org.uk>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <0340dce2-87fb-938d-615e-376e29f37b54@gmail.com>
Date:   Wed, 22 May 2019 20:27:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521211504.GD1580@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/21/19 11:15 PM, Mark Brown wrote:
> On Tue, May 21, 2019 at 10:30:38PM +0200, Jacek Anaszewski wrote:
> 
>>        regulator: lm363x: Make the gpio register enable flexible
>>        regulator: lm363x: Add support for LM36274
> 
> Why have these been applied, I haven't reviewed them?  As far as I can
> tell they were sent before the merge window so I'd expect a resend at
> this point...

The patch set have been floating around for some time and besides
the v2 you were cc'ed by Dan, I also poked you a week ago for v4 [1].
Don't be surprised that I assumed you simply don't care.

Still, we're awaiting your comments

[0] https://lkml.org/lkml/2019/4/10/547
[1] https://lkml.org/lkml/2019/5/14/717

-- 
Best regards,
Jacek Anaszewski
