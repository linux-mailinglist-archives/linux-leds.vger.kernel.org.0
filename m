Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257803E13AA
	for <lists+linux-leds@lfdr.de>; Thu,  5 Aug 2021 13:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240924AbhHELQ6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Aug 2021 07:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbhHELQ5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Aug 2021 07:16:57 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC67BC061765
        for <linux-leds@vger.kernel.org>; Thu,  5 Aug 2021 04:16:43 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id u21-20020a17090a8915b02901782c36f543so4993786pjn.4
        for <linux-leds@vger.kernel.org>; Thu, 05 Aug 2021 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ec1ubnGTZ0UpBpG/g+/7DgxXje7vYm5huuXGijAek3o=;
        b=lsk1cwLjJ8ZEyR1wGVi8ljJc3UL1lam/xNnFDy7x2+8NInRbp2tejLQz1NdDMz4a07
         tLy1bPzruG9VmIAw+6rUCjKhJ56CekDHhmlCyaj3kfIZrppe7d33S6osKv/V0oFjDfkQ
         NhNj7dTKBracQSRsCPvAC5Clo4RFXalcgMUnklGQN/QjbdhMn4B76SP8jYpBkjfigQG5
         1RZabMJMar+ZKnk6UgUveS0wSGpF+iuHRuBNzi/5Ldy+e/+GmK+iGWODX/CxijvhDCMK
         63tsQSPmxtpYw8F8+h7qTPlLxNOdl0cWUmuptWHu0pSKrS504wsU4+zGcuTC34rQntJI
         KfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ec1ubnGTZ0UpBpG/g+/7DgxXje7vYm5huuXGijAek3o=;
        b=JSikiR8jh1/kLVrww9bsserVVai47LKRxNgHAOawMItwBBOdQTJSd9BTi9bDXCuvK6
         GAopzRVc4gbNU5B7dI9Ku2VKKRIag7OYlgxkfagTSpaayzpwotel8DvmC100rlPr3xGt
         lIpTBLn+8wTY2gc08qcgfOBPXEBQkGJesTEIUjONDb5sJbLia3Z6Hdg0OkLpdw5/fngp
         SBYLSA3E+N94CSLUVSgFc7E7R2w2QWm/max1o57s0FrK3LfOUvGIHM/d8tIwsN65jaDK
         nvS5BOJ62qxwTfek8FicGfhT6lhOZPsu36hn7fZ+wu/Ui9djsM/hCgmP6Zk6FjFx7E0O
         fMYg==
X-Gm-Message-State: AOAM531/4zgHsRuNhrnbrOIuMuLmAGF/GKIyIIsLt3wclIYHUTln0WIM
        oukNFb6UGLbOi2XCSHeSV6nx5W44r1sQC7DaNW4=
X-Google-Smtp-Source: ABdhPJy9ueMnM0NoHDd1KzcsibFHjnuj/OzECPJVrYozYKR2x0WjH4MN9u90UsryDBrc3fUGh0FJ+DN01qrskI5t0ik=
X-Received: by 2002:a17:903:2444:b029:12c:8eba:fd6a with SMTP id
 l4-20020a1709032444b029012c8ebafd6amr3572953pls.0.1628162203212; Thu, 05 Aug
 2021 04:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <202108041809.QsYhsqqy-lkp@intel.com> <c303b831-54cf-2079-77e5-ae2cf79db45d@intel.com>
In-Reply-To: <c303b831-54cf-2079-77e5-ae2cf79db45d@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Aug 2021 14:16:03 +0300
Message-ID: <CAHp75Vf7oDkmvHpvcADMm2g1Lv5U9Ggt33ZgRwjQ6wUUM5y0WQ@mail.gmail.com>
Subject: Re: [pavel-linux-leds:for-next 9/18] drivers/leds/blink/leds-lgm-sso.c:635:4:
 warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
To:     kernel test robot <rong.a.chen@intel.com>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Aug 5, 2021 at 1:36 PM kernel test robot <rong.a.chen@intel.com> wr=
ote:
>
>
> tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-ne=
xt
> head:   64f67b5240db79eceb0bd57dae8e591fd3103ba0
> commit: 9999908ca1abee7aa518a4f6a3739517c137acbf [9/18] leds: lgm-sso:
> Put fwnode in any case during ->probe()
> config: x86_64-randconfig-c001-20210803 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project
> 4f71f59bf3d9914188a11d0c41bedbb339d36ff5)
> reproduce (this is a W=3D1 build):
>          wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          #
> https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/comm=
it/?id=3D9999908ca1abee7aa518a4f6a3739517c137acbf
>          git remote add pavel-linux-leds
> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
>          git fetch --no-tags pavel-linux-leds for-next
>          git checkout 9999908ca1abee7aa518a4f6a3739517c137acbf
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross
> ARCH=3Dx86_64 clang-analyzer
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Oh l=C3=A0 l=C3=A0, it reveals another piece of (broken) code in that drive=
r,
i.e. we shadow error codes when bailing out from the loop. I'll
prepare a separate fix for that, thanks!

--=20
With Best Regards,
Andy Shevchenko
